// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/domain/userModel/user_model.dart';
import 'package:messenger_chat/core/shared/providers.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/status/domain/ab_status_services.dart';
import 'package:messenger_chat/status/domain/statusModel/status_model.dart';
import 'package:uuid/uuid.dart';

class StatusServices extends AbStatusServices {
  final FirebaseAuth auth;
  final FirebaseFirestore firebaseFirestore;
  final ProviderRef ref;

  StatusServices(
    this.auth,
    this.firebaseFirestore,
    this.ref,
  );

  @override
  void uploadStatus(
    BuildContext context,
    String userName,
    String profilePic,
    String phoneNumber,
    File statusImage,
  ) async {
    try {
      var statusId = const Uuid().v1();
      String uId = auth.currentUser!.uid;
      String imageUrl =
          await ref.read(commonFirebaseStorageProvider).storeFileToFirebase(
                '/status/$statusId$uId',
                statusImage,
              );

      List<Contact> contacts = [];
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }

      List<String> uidWhoCanSee = [];

      for (int i = 0; i < contacts.length; i++) {
        var userDataFirebase = await firebaseFirestore
            .collection('users')
            .where(
              'phoneNumber',
              isEqualTo: contacts[i].phones[0].number.replaceAll(
                    ' ',
                    '',
                  ),
            )
            .get();

        if (userDataFirebase.docs.isNotEmpty) {
          var userData = UserModel.fromMap(
            userDataFirebase.docs[0].data(),
          );
          uidWhoCanSee.add(userData.uId);
        }
      }
      List<String> statusImageUrls = [];
      var statusSnapshot = await firebaseFirestore
          .collection('status')
          .where(
            'uId',
            isEqualTo: auth.currentUser!.uid,
          )
          .get();

      if (statusSnapshot.docs.isNotEmpty) {
        StatusModel statusModel = StatusModel.fromMap(
          statusSnapshot.docs[0].data(),
        );
        statusImageUrls = statusModel.photoUrl;
        statusImageUrls.add(imageUrl);
        await firebaseFirestore
            .collection('status')
            .doc(statusSnapshot.docs[0].id)
            .update(
          {
            'photoUrl': statusImageUrls,
          },
        );
        return;
      } else {
        statusImageUrls = [imageUrl];
      }

      StatusModel statusModel = StatusModel(
        uId: uId,
        userName: userName,
        phoneNumber: phoneNumber,
        photoUrl: statusImageUrls,
        createdAt: DateTime.now(),
        profilePic: profilePic,
        statusId: statusId,
        whoCanSee: uidWhoCanSee,
      );

      await firebaseFirestore.collection('status').doc(statusId).set(
            statusModel.toMap(),
          );
    } catch (e) {
      AppConstant.showSnackbar(
        context,
        e.toString(),
        Colors.black,
      );
    }
  }

  @override
  Future<List<StatusModel>> getStatus(
    BuildContext context,
  ) async {
    List<StatusModel> statusData = [];
    try {
      List<Contact> contacts = [];
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }

      for (int i = 0; i < contacts.length; i++) {
        var statusSnapshot = await firebaseFirestore
            .collection('status')
            .where(
              'phoneNumber',
              isEqualTo: contacts[i].phones[0].number.replaceAll(
                    ' ',
                    '',
                  ),
            )
            .where(
              'createdAt',
              isGreaterThan: DateTime.now()
                  .subtract(const Duration(hours: 24))
                  .millisecondsSinceEpoch,
            )
            .get();
        for (var tempData in statusSnapshot.docs) {
          StatusModel temp = StatusModel.fromMap(
            tempData.data(),
          );
          if (temp.whoCanSee.contains(auth.currentUser!.uid)) {
            statusData.add(temp);
          }
        }
      }
    } catch (e) {
      if (kDebugMode) print(e.toString());
      AppConstant.showSnackbar(
        context,
        e.toString(),
        Colors.black,
      );
    }
    return statusData;
  }
}
