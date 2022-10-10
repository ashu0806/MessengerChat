import 'package:flutter/material.dart';
import 'package:messenger_chat/auth/infra/firebase_auth_services.dart';

class AuthNotifier {
  final FirebaseAuthServices services;

  AuthNotifier(this.services);

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