import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/shared/providers.dart';
import 'package:messenger_chat/call/domain/callModel/call_model.dart';
import 'package:messenger_chat/call/infra/call_services.dart';
import 'package:uuid/uuid.dart';

class CallNotifier {
  final CallServices callServices;
  final ProviderRef ref;
  final FirebaseAuth auth;

  CallNotifier(
    this.callServices,
    this.ref,
    this.auth,
  );

  void makeCall(
    BuildContext context,
    String receiverName,
    String receiverUid,
    String receiverProfilePic,
    bool isGroupChat,
  ) {
    ref.read(userDataProvider).whenData(
      (value) {
        String callId = const Uuid().v1();
        CallModel senderCallData = CallModel(
          callerId: auth.currentUser!.uid,
          callerName: value!.name,
          callerPic: value.profilePic,
          receiverId: receiverUid,
          receiverName: receiverName,
          receiverPic: receiverProfilePic,
          callId: callId,
          hasDialed: true,
        );
        CallModel receiverCallData = CallModel(
          callerId: auth.currentUser!.uid,
          callerName: value.name,
          callerPic: value.profilePic,
          receiverId: receiverUid,
          receiverName: receiverName,
          receiverPic: receiverProfilePic,
          callId: callId,
          hasDialed: false,
        );

        if (isGroupChat) {
          callServices.makeGroupCall(
            senderCallData,
            context,
            receiverCallData,
          );
        } else {
          callServices.makeCall(
            senderCallData,
            context,
            receiverCallData,
          );
        }
      },
    );
  }

  void endCall(
    String callerId,
    String receiverId,
    BuildContext context,
    bool isGroupChat,
  ) {
    if (isGroupChat) {
      callServices.endGroupCall(
        callerId,
        receiverId,
        context,
      );
    } else {
      callServices.endCall(
        callerId,
        receiverId,
        context,
      );
    }
  }

  Stream<DocumentSnapshot> get callStream => callServices.callStream;
}
