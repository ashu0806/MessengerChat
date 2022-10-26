import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/domain/userModel/user_model.dart';
import 'package:messenger_chat/auth/infra/firebase_auth_services.dart';

class AuthNotifier {
  final FirebaseAuthServices services;
  final ProviderRef ref;

  AuthNotifier(
    this.services,
    this.ref,
  );

  void signIn(
    BuildContext context,
    String phone,
  ) {
    services.signInWithPhone(
      context,
      phone,
    );
  }

  void verify(
    BuildContext context,
    String verificationCode,
    String userEnteredOtp,
  ) {
    services.verifyOtp(
      context,
      verificationCode,
      userEnteredOtp,
    );
  }

  void sendDataToFirebase(
    BuildContext context,
    String name,
    File? profilePic,
  ) {
    services.saveUserData(
      context,
      name,
      profilePic,
      ref,
    );
  }

  Future<UserModel?> getUserData() async {
    UserModel? user = await services.getCurrentUserData();
    return user;
  }

  Stream<UserModel> fetchData(
    String userId,
  ) {
    return services.fetchUserData(
      userId,
    );
  }

  void setUserState(bool isOnline) {
    services.setUserState(
      isOnline,
    );
  }
}

// class AuthNotifier extends StateNotifier<AuthState> {
//   AuthNotifier(
//     super.state,
//     this.services,
//   );
//   final FirebaseAuthServices services;

// Future<void> signIn(
//   BuildContext context,
//   String phone,
// ) async {
//   final data = await services.signInWithPhone(
//     context,
//     phone,
//   );
//   data.fold(
//     (l) => AuthState.failure(l),
//     (r) => const AuthState.authenticated(),
//   );
// }
// }