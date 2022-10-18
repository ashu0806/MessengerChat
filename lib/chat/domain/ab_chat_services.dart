import 'package:flutter/cupertino.dart';
import 'package:messenger_chat/auth/domain/userModel/user_model.dart';

abstract class AbChatServices {
  void sendTextMessage(
    BuildContext context,
    String text,
    String receiverUserId,
    UserModel senderUser,
  );
}
