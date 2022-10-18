// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:messenger_chat/auth/domain/userModel/user_model.dart';
import 'package:messenger_chat/core/routes/router.gr.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/getContacts/domain/ab_get_contact_services.dart';

class GetContactServices extends AbGetContactServices {
  final FirebaseFirestore firestore;

  GetContactServices(
    this.firestore,
  );

  @override
  Future<List<Contact>> getContactList() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(
          withProperties: true,
        );
      }
    } catch (e) {
      debugPrint(
        e.toString(),
      );
    }
    return contacts;
  }

  @override
  void checkSelectedContact(
    BuildContext context,
    Contact selectedContact,
  ) async {
    try {
      var userCollection = await firestore.collection('users').get();
      bool isFound = false;

      for (var doc in userCollection.docs) {
        var userData = UserModel.fromMap(doc.data());
        String selectedPhoneNumber =
            selectedContact.phones[0].number.replaceAll(
          ' ',
          '',
        );
        if (selectedPhoneNumber == userData.phoneNumber) {
          isFound = true;
          AutoRouter.of(context).push(
            ChatRoute(
              userName: userData.name,
              userId: userData.uId,
            ),
          );
        }
      }
      if (!isFound) {
        AppConstant.showSnackbar(
          context,
          "The user with this number doesn't exist.",
          Colors.black,
        );
      }
    } catch (e) {
      AppConstant.showSnackbar(
        context,
        e.toString(),
        Colors.black,
      );
    }
  }
}
