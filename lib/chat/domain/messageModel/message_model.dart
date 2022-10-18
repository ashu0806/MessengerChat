// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:messenger_chat/chat/infra/chat_services.dart';

class MessageModel {
  final String senderId;
  final String receiverId;
  final String text;
  final MessageEnum messageType;
  final DateTime sentTime;
  final String messageId;
  final bool isSeen;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.messageType,
    required this.sentTime,
    required this.messageId,
    required this.isSeen,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'messageType': messageType.type,
      'sentTime': sentTime.millisecondsSinceEpoch,
      'messageId': messageId,
      'isSeen': isSeen,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      text: map['text'] as String,
      messageType: (map['messageType'] as String).toEnum(),
      sentTime: DateTime.fromMillisecondsSinceEpoch(map['sentTime'] as int),
      messageId: map['messageId'] as String,
      isSeen: map['isSeen'] as bool,
    );
  }
}
