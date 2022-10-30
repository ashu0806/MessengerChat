import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:messenger_chat/status/domain/statusModel/status_model.dart';

abstract class AbStatusServices {
  void uploadStatus(
    BuildContext context,
    String userName,
    String profilePic,
    String phoneNumber,
    File statusImage,
  );

  Future<List<StatusModel>> getStatus(
    BuildContext context,
  );
}
