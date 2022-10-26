// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/domain/abFirebaseAuthServices/ab_firebase_auth_services.dart';
import 'package:messenger_chat/auth/domain/userModel/user_model.dart';
import 'package:messenger_chat/core/routes/router.gr.dart';
import 'package:messenger_chat/core/shared/providers.dart';
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
        "Log in successfully...",
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

  @override
  void saveUserData(
    BuildContext context,
    String name,
    File? profilePic,
    ProviderRef ref,
  ) async {
    try {
      String uId = auth.currentUser!.uid;
      String photoUrl =
          'https://tse4.mm.bing.net/th?id=OIP.DxdqBFLVLPcWsjkds8636QHaHf&pid=Api&P=0';

      if (profilePic != null) {
        photoUrl =
            await ref.read(commonFirebaseStorageProvider).storeFileToFirebase(
                  'profilePic/$uId',
                  profilePic,
                );

        var user = UserModel(
          name: name,
          uId: uId,
          profilePic: photoUrl,
          isOnline: true,
          phoneNumber: auth.currentUser!.phoneNumber.toString(),
          // groupIds: [],
        );

        await firebaseFirestore.collection('users').doc(uId).set(
              user.toMap(),
            );
        Future.delayed(
          const Duration(seconds: 2),
          () {
            AutoRouter.of(context).pushAndPopUntil(
              const HomeRoute(),
              predicate: (route) => false,
            );
          },
        );
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
  Future<bool> getSignedInUser() async => auth.currentUser?.uid != null;

  @override
  Future<UserModel?> getCurrentUserData() async {
    var userData = await firebaseFirestore
        .collection('users')
        .doc(auth.currentUser?.uid)
        .get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(
        userData.data()!,
      );
    }
    return user;
  }

  @override
  Stream<UserModel> fetchUserData(
    String userId,
  ) {
    return firebaseFirestore.collection('users').doc(userId).snapshots().map(
          (event) => UserModel.fromMap(
            event.data()!,
          ),
        );
  }

  void setUserState(bool isOnline) async {
    await firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update(
      {
        "isOnline": isOnline,
      },
    );
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