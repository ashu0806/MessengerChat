// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_chat/auth/domain/abFirebaseAuthServices/ab_firebase_auth_services.dart';
import 'package:messenger_chat/core/routes/router.gr.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';

class FirebaseAuthServices extends AbFirebaseAuthServices {
  final FirebaseAuth auth;
  final FirebaseFirestore firebaseFirestore;

  FirebaseAuthServices(
    this.auth,
    this.firebaseFirestore,
  );
  @override
  void signInWithPhone(
    BuildContext context,
    String phoneNumber,
  ) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: (verificationId, forceResendingToken) {
          AutoRouter.of(context).push(
            OtpRoute(
              verificationCode: verificationId,
            ),
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: const Duration(
          seconds: 60,
        ),
      );
    } on FirebaseAuthException catch (e) {
      AppConstant.showSnackbar(
        context,
        e.message!,
        Colors.black,
      );
    }
  }

  @override
  void verifyOtp(
    BuildContext context,
    String verificationCode,
    String userEnteredOtp,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationCode,
        smsCode: userEnteredOtp,
      );
      auth.signInWithCredential(credential);
      AppConstant.showLoader(
        context,
        "User Created Successfully",
      );
      Future.delayed(
        const Duration(
          seconds: 2,
        ),
        () {
          AutoRouter.of(context).pushAndPopUntil(
            const UserInfoRoute(),
            predicate: (route) => false,
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      AppConstant.showSnackbar(
        context,
        e.message!,
        Colors.black,
      );
    }
  }
}



// class FirebaseAuthServices extends AbFirebaseAuthServices {
// final FirebaseAuth auth;
// final FirebaseFirestore firebaseFirestore;

//   FirebaseAuthServices(
//     this.auth,
//     this.firebaseFirestore,
//   );
//   @override
//   Future<Either<AuthFailure, Unit>> signInWithPhone(
//     BuildContext context,
//     String phoneNumber,
//   ) async {
//   try {
//     await auth.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await auth.signInWithCredential(credential);
//       },
//       verificationFailed: (e) {
//         throw Exception(e.message);
//       },
//       codeSent: (verificationId, forceResendingToken) {},
//       codeAutoRetrievalTimeout: (verificationId) {},
//     );
//     return right(unit);
//   } on FirebaseAuthException {
//     return left(
//       const AuthFailure.serverError(),
//     );
//   }
// }
// }