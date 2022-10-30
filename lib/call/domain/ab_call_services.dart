import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:messenger_chat/call/domain/callModel/call_model.dart';

abstract class AbCallServices {
  void makeCall(
    CallModel senderCallData,
    BuildContext context,
    CallModel receiverCallData,
  );
  void makeGroupCall(
    CallModel senderCallData,
    BuildContext context,
    CallModel receiverCallData,
  );
  void endCall(
    String callerId,
    String receiverId,
    BuildContext context,
  );
  void endGroupCall(
    String callerId,
    String receiverId,
    BuildContext context,
  );
  Stream<DocumentSnapshot> get callStream;
}
