import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/shared/providers.dart';
import 'package:messenger_chat/chat/domain/chatContactModel/chat_contact_model.dart';
import 'package:messenger_chat/chat/domain/messageModel/message_model.dart';
import 'package:messenger_chat/chat/infra/chat_services.dart';
import 'package:messenger_chat/core/shared/message_enum.dart';
import 'package:messenger_chat/core/shared/providers.dart';

class ChatNotifier {
  final ChatServices service;
  final ProviderRef ref;

  ChatNotifier(
    this.service,
    this.ref,
  );

  Stream<List<ChatContactModel>> chatContacts() {
    return service.getContactsList();
  }

  Stream<List<MessageModel>> getChatStream(
    String receiverUserId,
  ) {
    return service.getMessageStream(
      receiverUserId,
    );
  }

  void sendTextMessage(
    BuildContext context,
    String text,
    String receiverUserId,
  ) {
    final messageReply = ref.read(messageReplyProvider);
    ref.read(userDataProvider).whenData(
          (value) => service.sendTextMessage(
            context,
            text,
            receiverUserId,
            value!,
            messageReply,
          ),
        );
    ref.read(messageReplyProvider.state).update(
          (state) => null,
        );
  }

  void sendFileMessage(
    BuildContext context,
    File file,
    String receiverUserId,
    MessageEnum messageEnum,
  ) {
    final messageReply = ref.read(messageReplyProvider);
    ref.read(userDataProvider).whenData(
          (value) => service.sendFileMessage(
            context,
            file,
            receiverUserId,
            value!,
            ref,
            messageEnum,
            messageReply,
          ),
        );
    ref.read(messageReplyProvider.state).update(
          (state) => null,
        );
  }

  void sendGIFMessage(
    BuildContext context,
    String gifUrl,
    String receiverUserId,
  ) {
    final messageReply = ref.read(messageReplyProvider);
    ref.read(userDataProvider).whenData(
          (value) => service.sendGIFMessage(
            context,
            gifUrl,
            receiverUserId,
            value!,
            messageReply,
          ),
        );
    ref.read(messageReplyProvider.state).update(
          (state) => null,
        );
  }

  void setChatMessageSeen(
    BuildContext context,
    String receiverUserId,
    String messageId,
  ) {
    service.setChatMessageSeen(
      context,
      receiverUserId,
      messageId,
    );
  }
}
