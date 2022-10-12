import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class CommonFirebaseStorage {
  final FirebaseStorage storage;

  CommonFirebaseStorage(
    this.storage,
  );

  Future<String> storeFileToFirebase(
    String ref,
    File file,
  ) async {
    UploadTask uploadTask = storage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
