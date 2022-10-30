import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

abstract class AbGroupServices {
  void createGroup(
    BuildContext context,
    String name,
    File groupProfilePic,
    List<Contact> selectedContact,
  );
}
