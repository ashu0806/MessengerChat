import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:messenger_chat/auth/domain/abFirebaseAuthServices/ab_firebase_auth_services.dart';
import 'package:messenger_chat/auth/domain/authFailure/auth_failure.dart';

class FirebaseAuthServices extends AbFirebaseAuthServices {
  final FirebaseAuth auth;
  final FirebaseFirestore firebaseFirestore;

  FirebaseAuthServices(
    this.auth,
    this.firebaseFirestore,
  );
  @override
  Future<Either<AuthFailure, Unit>> signInWithPhone(
      BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: (verificationId, forceResendingToken) {},
        codeAutoRetrievalTimeout: (verificationId) {},
      );
      return right(unit);
    } on FirebaseAuthException {
      return left(
        const AuthFailure.serverError(),
      );
    }
  }
}
