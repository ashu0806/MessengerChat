// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_chat/call/domain/ab_call_services.dart';
import 'package:messenger_chat/call/domain/callModel/call_model.dart';
import 'package:messenger_chat/core/routes/router.gr.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/group/domain/groupModel/group_model.dart'
    as model;

class CallServices extends AbCallServices {
  final FirebaseAuth auth;
  final FirebaseFirestore firebaseFirestore;

  CallServices(
    this.auth,
    this.firebaseFirestore,
  );

  @override
  void makeCall(
    CallModel senderCallData,
    BuildContext context,
    CallModel receiverCallData,
  ) async {
    try {
      await firebaseFirestore
          .collection('call')
          .doc(senderCallData.callerId)
          .set(senderCallData.toMap());
      await firebaseFirestore
          .collection('call')
          .doc(senderCallData.receiverId)
          .set(receiverCallData.toMap());

      AutoRouter.of(context).push(
        CallRoute(
          channelId: senderCallData.callId,
          callModel: senderCallData,
          isGroupChat: false,
        ),
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
  void makeGroupCall(
    CallModel senderCallData,
    BuildContext context,
    CallModel receiverCallData,
  ) async {
    try {
      await firebaseFirestore
          .collection('call')
          .doc(senderCallData.callerId)
          .set(senderCallData.toMap());

      var groupSnapshot = await firebaseFirestore
          .collection('groups')
          .doc(senderCallData.receiverId)
          .get();
      model.GroupModel group = model.GroupModel.fromMap(
        groupSnapshot.data()!,
      );

      for (var id in group.membersUid) {
        await firebaseFirestore
            .collection('call')
            .doc(id)
            .set(receiverCallData.toMap());
      }

      AutoRouter.of(context).push(
        CallRoute(
          channelId: senderCallData.callId,
          callModel: senderCallData,
          isGroupChat: true,
        ),
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
  void endCall(
    String callerId,
    String receiverId,
    BuildContext context,
  ) async {
    try {
      await firebaseFirestore.collection('call').doc(callerId).delete();
      await firebaseFirestore.collection('call').doc(receiverId).delete();
    } catch (e) {
      AppConstant.showSnackbar(
        context,
        e.toString(),
        Colors.black,
      );
    }
  }

  @override
  void endGroupCall(
    String callerId,
    String receiverId,
    BuildContext context,
  ) async {
    try {
      await firebaseFirestore.collection('call').doc(callerId).delete();

      var groupSnapshot =
          await firebaseFirestore.collection('groups').doc(receiverId).get();
      model.GroupModel group = model.GroupModel.fromMap(
        groupSnapshot.data()!,
      );

      for (var id in group.membersUid) {
        await firebaseFirestore.collection('call').doc(id).delete();
      }
    } catch (e) {
      AppConstant.showSnackbar(
        context,
        e.toString(),
        Colors.black,
      );
    }
  }

  @override
  Stream<DocumentSnapshot> get callStream => firebaseFirestore
      .collection('call')
      .doc(auth.currentUser!.uid)
      .snapshots();
}
