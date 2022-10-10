import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

abstract class AbFirebaseAuthServices {
  // Future<Either<AuthFailure, Unit>> signInWithPhone(
  //   BuildContext context,
  //   String phoneNumber,
  // );
  void signInWithPhone(
    BuildContext context,
    String phoneNumber,
  );
  void verifyOtp(
    BuildContext context,
    String verificationCode,
    String userEnteredOtp,
  );
}
