import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/core/infra/common_firebase_storage.dart';
import 'package:messenger_chat/core/infra/message_reply.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) {
    return FirebaseAuth.instance;
  },
);

final firebaseFirestoreProvider = Provider<FirebaseFirestore>(
  (ref) {
    return FirebaseFirestore.instance;
  },
);
final firebaseStorageProvider = Provider<FirebaseStorage>(
  (ref) {
    return FirebaseStorage.instance;
  },
);

final commonFirebaseStorageProvider = Provider<CommonFirebaseStorage>(
  (ref) {
    return CommonFirebaseStorage(
      ref.watch(firebaseStorageProvider),
    );
  },
);

final messageReplyProvider = StateProvider<MessageReply?>(
  (ref) {
    return null;
  },
);
