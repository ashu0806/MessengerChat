import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/shared/providers.dart';
import 'package:messenger_chat/chat/infra/chat_services.dart';

class ChatNotifier {
  final ChatServices service;
  final ProviderRef ref;

  ChatNotifier(
    this.service,
    this.ref,
  );

  void sendMessage(
    BuildContext context,
    String text,
    String receiverUserId,
  ) {
    ref.read(userDataProvider).whenData(
          (value) => service.sendTextMessage(
            context,
            text,
            receiverUserId,
            value!,
          ),
        );
  }
}
