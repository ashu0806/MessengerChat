import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger_chat/auth/domain/authFailure/auth_failure.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.failure(
    AuthFailure authFailure,
  ) = _Failure;
}
