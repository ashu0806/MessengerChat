import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/domain/authState/auth_state.dart';
import 'package:messenger_chat/auth/infra/firebase_auth_services.dart';

class LoginNotifier extends StateNotifier<AuthState> {
  LoginNotifier(
    super.state,
    this.service,
  );
  final FirebaseAuthServices service;

  Future<void> isLogin() async {
    state = await service.getSignedInUser()
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
  }
}
