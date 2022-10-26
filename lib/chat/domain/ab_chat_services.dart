import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/domain/userModel/user_model.dart';
import 'package:messenger_chat/chat/domain/chatContactModel/chat_contact_model.dart';
import 'package:messenger_chat/chat/domain/messageModel/message_model.dart';
import 'package:messenger_chat/core/infra/message_reply.dart';
import 'package:messenger_chat/core/shared/message_enum.dart';

abstract class AbChatServices {
  void sendTextMessage(
    BuildContext context,
    String text,
    String receiverUserId,
    UserModel senderUserData,
    MessageReply? messageReply,
  );

  void sendFileMessage(
    BuildContext context,
    File file,
    String receiverUserId,
    UserModel senderUserData,
    ProviderRef ref,
    MessageEnum messageEnum,
    MessageReply? messageReply,
  );

  void sendGIFMessage(
    BuildContext context,
    String gifUrl,
    String receiverUserId,
    UserModel senderUserData,
    MessageReply? messageReply,
  );

  void setChatMessageSeen(
    BuildContext context,
    String receiverUserId,
    String messageId,
  );

  Stream<List<ChatContactModel>> getContactsList();
  Stream<List<MessageModel>> getMessageStream(
    String receiverUserId,
  );
}
