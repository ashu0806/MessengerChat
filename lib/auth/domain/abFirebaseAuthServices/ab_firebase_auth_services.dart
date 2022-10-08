import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:messenger_chat/auth/domain/authFailure/auth_failure.dart';

abstract class AbFirebaseAuthServices {
  Future<Either<AuthFailure, Unit>> signInWithPhone(
    BuildContext context,
    String phoneNumber,
  );
}
