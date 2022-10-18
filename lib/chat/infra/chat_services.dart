// ignore_for_file: unused_local_variable, avoid_renaming_method_parameters

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_chat/auth/domain/userModel/user_model.dart';
import 'package:messenger_chat/chat/domain/ab_chat_services.dart';
import 'package:messenger_chat/chat/domain/chatContactModel/chat_contact_model.dart';
import 'package:messenger_chat/chat/domain/messageModel/message_model.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:uuid/uuid.dart';

enum MessageEnum {
  text('text'),
  image('image'),
  audio('audio'),
  video('video'),
  gif('gif');

  const MessageEnum(this.type);
  final String type;
}

extension ConvertMessage on String {
  MessageEnum toEnum() {
    switch (this) {
      case 'text':
        return MessageEnum.text;
      case 'audio':
        return MessageEnum.audio;
      case 'video':
        return MessageEnum.video;
      case 'image':
        return MessageEnum.image;
      case 'gif':
        return MessageEnum.gif;
      default:
        return MessageEnum.text;
    }
  }
}

class ChatServices extends AbChatServices {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth auth;

  ChatServices(
    this.firebaseFirestore,
    this.auth,
  );

  void _saveDataToContactSubCollection({
    required UserModel senderUserData,
    required UserModel receiverUserData,
    required String text,
    required DateTime sentTime,
    required String receiverUserId,
  }) async {
    //users->receiver user id -> chats-> current user id -> set data
    var receiverChatContact = ChatContactModel(
      name: senderUserData.name,
      profilePic: senderUserData.profilePic,
      contactId: senderUserData.uId,
      sentTime: sentTime,
      lastMessage: text,
    );
    await firebaseFirestore
        .collection('users')
        .doc(receiverUserId)
        .collection('chats')
        .doc(senderUserData.uId)
        .set(
          receiverChatContact.toMap(),
        );
    //users->  current user id-> chats-> receiver user id-> set data
    var senderChatContact = ChatContactModel(
      name: receiverUserData.name,
      profilePic: receiverUserData.profilePic,
      contactId: receiverUserData.uId,
      sentTime: sentTime,
      lastMessage: text,
    );
    await firebaseFirestore
        .collection('users')
        .doc(senderUserData.uId)
        .collection('chats')
        .doc(receiverUserId)
        .set(
          receiverChatContact.toMap(),
        );
  }

  _sentMessageToMessageSubCollection({
    required String receiverUserId,
    required String text,
    required DateTime sentTime,
    required String messageId,
    required String senderUserName,
    required String receiverUserName,
    required MessageEnum messageType,
  }) async {
    final message = MessageModel(
      senderId: auth.currentUser!.uid,
      receiverId: receiverUserId,
      text: text,
      messageType: messageType,
      sentTime: sentTime,
      messageId: messageId,
      isSeen: false,
    );
    // users-> sender id-> receiver id -> messages -> message id -> store message
    await firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(receiverUserId)
        .collection('messages')
        .doc(messageId)
        .set(
          message.toMap(),
        );
    // users-> receiver id-> sender id -> messages -> message id -> store message
    await firebaseFirestore
        .collection('users')
        .doc(receiverUserId)
        .collection('chats')
        .doc(auth.currentUser!.uid)
        .collection('messages')
        .doc(messageId)
        .set(
          message.toMap(),
        );
  }

  @override
  void sendTextMessage(
    BuildContext context,
    String text,
    String receiverUserId,
    UserModel senderUserData,
  ) async {
    try {
      var sentMessageTime = DateTime.now();
      UserModel receiversData;
      var userDataMap =
          await firebaseFirestore.collection('users').doc(receiverUserId).get();

      receiversData = UserModel.fromMap(
        userDataMap.data()!,
      );

      var messageId = const Uuid().v1();
      _saveDataToContactSubCollection(
        senderUserData: senderUserData,
        receiverUserData: receiversData,
        text: text,
        sentTime: sentMessageTime,
        receiverUserId: receiverUserId,
      );
      _sentMessageToMessageSubCollection(
        receiverUserId: receiverUserId,
        receiverUserName: receiversData.name,
        senderUserName: senderUserData.name,
        sentTime: sentMessageTime,
        text: text,
        messageType: MessageEnum.text,
        messageId: messageId,
      );
    } catch (e) {
      AppConstant.showSnackbar(
        context,
        e.toString(),
        Colors.black,
      );
    }
  }
}
