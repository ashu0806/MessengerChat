import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:messenger_chat/chat/shared/providers.dart';
import 'package:messenger_chat/chat/widgets/my_message_card.dart';
import 'package:messenger_chat/chat/widgets/sender_message_card.dart';
import 'package:messenger_chat/core/infra/message_reply.dart';
import 'package:messenger_chat/core/shared/message_enum.dart';
import 'package:messenger_chat/core/shared/providers.dart';

class ChatListWidget extends StatefulHookConsumerWidget {
  final String receiverUserId;
  const ChatListWidget({
    super.key,
    required this.receiverUserId,
  });

  @override
  ConsumerState<ChatListWidget> createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends ConsumerState<ChatListWidget> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onMessageSwipe(
    String message,
    bool isMe,
    MessageEnum messageEnum,
  ) {
    ref.read(messageReplyProvider.state).update(
          (state) => MessageReply(
            message,
            isMe,
            messageEnum,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.read(chatNotifierProvider).getChatStream(
            widget.receiverUserId,
          ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          SchedulerBinding.instance.addPostFrameCallback(
            (_) {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            },
          );
          return ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var message = snapshot.data![index];
              var timeSent = DateFormat.Hm().format(message.sentTime);

              if (!message.isSeen &&
                  message.receiverId ==
                      FirebaseAuth.instance.currentUser!.uid) {
                ref.read(chatNotifierProvider).setChatMessageSeen(
                      context,
                      widget.receiverUserId,
                      message.messageId,
                    );
              }
              if (message.senderId == FirebaseAuth.instance.currentUser!.uid) {
                return MyMessageCard(
                  message: message.text,
                  time: timeSent,
                  type: message.messageType,
                  repliedText: message.repliedMessage,
                  repliedMessageType: message.repliedMessageType,
                  userName: message.repliedTo,
                  onSwipeLeft: () => onMessageSwipe(
                    message.text,
                    true,
                    message.messageType,
                  ),
                  isSeen: message.isSeen,
                );
              }
              return SenderMessageCard(
                message: message.text,
                time: timeSent,
                type: message.messageType,
                repliedText: message.repliedMessage,
                repliedMessageType: message.repliedMessageType,
                userName: message.repliedTo,
                onSwipeRight: () => onMessageSwipe(
                  message.text,
                  false,
                  message.messageType,
                ),
                isSeen: message.isSeen,
              );
            },
          );
        } else {
          return const Text(
            "No data",
          );
        }
      },
    );
  }
}
