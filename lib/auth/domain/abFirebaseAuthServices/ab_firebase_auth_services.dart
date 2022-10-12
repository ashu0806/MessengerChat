import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class AbFirebaseAuthServices {
  void signInWithPhone(
    BuildContext context,
    String phoneNumber,
  );
  void verifyOtp(
    BuildContext context,
    String verificationCode,
    String userEnteredOtp,
  );

  void saveUserData(
    BuildContext context,
    String name,
    File? profilePic,
    ProviderRef ref,
  );

  Future<bool> getSignedInUser();
}

// Future<Either<AuthFailure, Unit>> signInWithPhone(
  //   BuildContext context,
  //   String phoneNumber,
  // );