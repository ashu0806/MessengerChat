import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';

abstract class AbGetContactServices {
  Future<List<Contact>> getContactList();

  void checkSelectedContact(
    BuildContext context,
    Contact selectedContact,
  );
}
