// ignore_for_file: unused_local_variable, avoid_renaming_method_parameters, depend_on_referenced_packages

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_chat/auth/domain/userModel/user_model.dart';
import 'package:messenger_chat/chat/domain/ab_chat_services.dart';
import 'package:messenger_chat/chat/domain/chatContactModel/chat_contact_model.dart';
import 'package:messenger_chat/chat/domain/messageModel/message_model.dart';
import 'package:messenger_chat/core/infra/message_reply.dart';
import 'package:messenger_chat/core/shared/message_enum.dart';
import 'package:messenger_chat/core/shared/providers.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:riverpod/src/provider.dart';
import 'package:uuid/uuid.dart';

class ChatServices extends AbChatServices {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth auth;

  ChatServices(
    this.firebaseFirestore,
    this.auth,
  );

  void _saveDataToContactSubCollection({
    required UserModel senderUserData,
    required UserModel? receiverUserData,
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
        .doc(auth.currentUser!.uid)
        .set(
          receiverChatContact.toMap(),
        );
    //users->  current user id-> chats-> receiver user id-> set data
    var senderChatContact = ChatContactModel(
      name: receiverUserData!.name,
      profilePic: receiverUserData.profilePic,
      contactId: receiverUserData.uId,
      sentTime: sentTime,
      lastMessage: text,
    );
    await firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(receiverUserId)
        .set(
          senderChatContact.toMap(),
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
    required MessageReply? messageReply,
  }) async {
    final message = MessageModel(
      senderId: auth.currentUser!.uid,
      receiverId: receiverUserId,
      text: text,
      messageType: messageType,
      sentTime: sentTime,
      messageId: messageId,
      isSeen: false,
      repliedMessage: messageReply == null ? "" : messageReply.message,
      repliedTo: messageReply == null
          ? ''
          : messageReply.isMe
              ? senderUserName
              : receiverUserName,
      repliedMessageType:
          messageReply == null ? MessageEnum.text : messageReply.messageEnum,
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
    MessageReply? messageReply,
  ) async {
    try {
      var sentMessageTime = DateTime.now();
      UserModel? receiversData;
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
        messageReply: messageReply,
      );
    } catch (e) {
      AppConstant.showSnackbar(
        context,
        e.toString(),
        Colors.black,
      );
    }
  }

  @override
  Stream<List<ChatContactModel>> getContactsList() {
    return firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .snapshots()
        .asyncMap(
      (event) async {
        List<ChatContactModel> contacts = [];
        for (var document in event.docs) {
          var chatContact = ChatContactModel.fromMap(
            document.data(),
          );
          var userData = await firebaseFirestore
              .collection('users')
              .doc(chatContact.contactId)
              .get();
          var user = UserModel.fromMap(
            userData.data()!,
          );

          contacts.add(
            ChatContactModel(
              name: user.name,
              profilePic: user.profilePic,
              contactId: chatContact.contactId,
              sentTime: chatContact.sentTime,
              lastMessage: chatContact.lastMessage,
            ),
          );
        }
        return contacts;
      },
    );
  }

  @override
  Stream<List<MessageModel>> getMessageStream(
    String receiverUserId,
  ) {
    return firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(receiverUserId)
        .collection('messages')
        .orderBy("sentTime")
        .snapshots()
        .map(
      (event) {
        List<MessageModel> messages = [];
        for (var doc in event.docs) {
          messages.add(
            MessageModel.fromMap(
              doc.data(),
            ),
          );
        }
        return messages;
      },
    );
  }

  @override
  void sendFileMessage(
    BuildContext context,
    File file,
    String receiverUserId,
    UserModel senderUserData,
    ProviderRef ref,
    MessageEnum messageEnum,
    MessageReply? messageReply,
  ) async {
    try {
      var timeSent = DateTime.now();
      var messsageId = const Uuid().v1();
      String fileUrl =
          await ref.read(commonFirebaseStorageProvider).storeFileToFirebase(
                'chat/${messageEnum.type}/${senderUserData.uId}/$receiverUserId/$messsageId',
                file,
              );
      UserModel receiverUserData;
      var userDataMap =
          await firebaseFirestore.collection('users').doc(receiverUserId).get();
      receiverUserData = UserModel.fromMap(
        userDataMap.data()!,
      );
      String contactMsg;

      switch (messageEnum) {
        case MessageEnum.image:
          contactMsg = '📷Photo';
          break;
        case MessageEnum.video:
          contactMsg = '📷Video';
          break;
        case MessageEnum.audio:
          contactMsg = '🔉Audio';
          break;
        case MessageEnum.gif:
          contactMsg = 'Gif';
          break;
        default:
          contactMsg = 'GIF';
      }

      _saveDataToContactSubCollection(
        senderUserData: senderUserData,
        receiverUserData: receiverUserData,
        text: contactMsg,
        sentTime: timeSent,
        receiverUserId: receiverUserId,
      );

      _sentMessageToMessageSubCollection(
        receiverUserId: receiverUserId,
        text: fileUrl,
        sentTime: timeSent,
        messageId: messsageId,
        senderUserName: senderUserData.name,
        receiverUserName: receiverUserData.name,
        messageType: messageEnum,
        messageReply: messageReply,
      );
    } catch (e) {
      AppConstant.showSnackbar(
        context,
        e.toString(),
        Colors.black,
      );
    }
  }

  @override
  void sendGIFMessage(
    BuildContext context,
    String gifUrl,
    String receiverUserId,
    UserModel senderUserData,
    MessageReply? messageReply,
  ) async {
    try {
      var sentMessageTime = DateTime.now();
      UserModel? receiversData;
      var userDataMap =
          await firebaseFirestore.collection('users').doc(receiverUserId).get();

      receiversData = UserModel.fromMap(
        userDataMap.data()!,
      );

      var messageId = const Uuid().v1();
      _saveDataToContactSubCollection(
        senderUserData: senderUserData,
        receiverUserData: receiversData,
        text: 'GIF',
        sentTime: sentMessageTime,
        receiverUserId: receiverUserId,
      );
      _sentMessageToMessageSubCollection(
        receiverUserId: receiverUserId,
        receiverUserName: receiversData.name,
        senderUserName: senderUserData.name,
        sentTime: sentMessageTime,
        text: gifUrl,
        messageType: MessageEnum.gif,
        messageId: messageId,
        messageReply: messageReply,
      );
    } catch (e) {
      AppConstant.showSnackbar(
        context,
        e.toString(),
        Colors.black,
      );
    }
  }

  @override
  void setChatMessageSeen(
    BuildContext context,
    String receiverUserId,
    String messageId,
  ) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('chats')
          .doc(receiverUserId)
          .collection('messages')
          .doc(messageId)
          .update(
        {
          'isSeen': true,
        },
      );
      await firebaseFirestore
          .collection('users')
          .doc(receiverUserId)
          .collection('chats')
          .doc(auth.currentUser!.uid)
          .collection('messages')
          .doc(messageId)
          .update(
        {
          'isSeen': true,
        },
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
