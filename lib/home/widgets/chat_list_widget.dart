import 'package:flutter/material.dart';
import 'package:messenger_chat/home/demo/message_info.dart';
import 'package:messenger_chat/home/widgets/my_message_card.dart';
import 'package:messenger_chat/home/widgets/sender_message_card.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (messages[index]["isMe"] == true) {
          return MyMessageCard(
            message: messages[index]["text"].toString(),
            time: messages[index]["time"].toString(),
          );
        } else {
          return SenderMessageCard(
            message: messages[index]["text"].toString(),
            time: messages[index]["time"].toString(),
          );
        }
      },
      itemCount: messages.length,
    );
  }
}
