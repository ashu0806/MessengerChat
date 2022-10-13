import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:messenger_chat/getContacts/infra/get_contact_services.dart';

class ContactsNotifier {
  final GetContactServices services;

  ContactsNotifier(
    this.services,
  );

  void selectContact(
    BuildContext context,
    Contact selectedContact,
  ) {
    services.checkSelectedContact(
      context,
      selectedContact,
    );
  }
}
