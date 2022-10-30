import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/group/infra/group_services.dart';

class GroupNotifier {
  final GroupServices services;
  final ProviderRef ref;

  GroupNotifier(
    this.services,
    this.ref,
  );

  void createGroup(
    BuildContext context,
    String groupName,
    File groupProfilePic,
    List<Contact> selectedContacts,
  ) {
    services.createGroup(
      context,
      groupName,
      groupProfilePic,
      selectedContacts,
    );
  }
}
