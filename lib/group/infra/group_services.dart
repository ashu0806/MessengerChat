import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/core/shared/providers.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/group/domain/ab_group_services.dart';
import 'package:messenger_chat/group/domain/groupModel/group_model.dart'
    as model;
import 'package:uuid/uuid.dart';

class GroupServices extends AbGroupServices {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth auth;
  final ProviderRef ref;

  GroupServices(
    this.firebaseFirestore,
    this.auth,
    this.ref,
  );

  @override
  void createGroup(
    BuildContext context,
    String name,
    File groupProfilePic,
    List<Contact> selectedContact,
  ) async {
    try {
      List<String> uIds = [];
      for (int i = 0; i < selectedContact.length; i++) {
        var userCollection = await firebaseFirestore
            .collection('users')
            .where(
              'phoneNumber',
              isEqualTo: selectedContact[i].phones[0].number.replaceAll(
                    ' ',
                    '',
                  ),
            )
            .get();
        if (userCollection.docs.isNotEmpty && userCollection.docs[0].exists) {
          uIds.add(
            userCollection.docs[0].data()['uId'],
          );
        }
      }

      var groupId = const Uuid().v1();

      String groupProfileUrl =
          await ref.read(commonFirebaseStorageProvider).storeFileToFirebase(
                '/group/$groupId',
                groupProfilePic,
              );
      model.GroupModel group = model.GroupModel(
        auth.currentUser!.uid,
        name,
        groupId,
        '',
        groupProfileUrl,
        [auth.currentUser!.uid, ...uIds],
        DateTime.now(),
      );
      await firebaseFirestore.collection('groups').doc(groupId).set(
            group.toMap(),
          );
    } catch (e) {
      AppConstant.showSnackbar(
        context,
        e.toString(),
        Colors.black,
      );
    }
  }
}
