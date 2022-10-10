import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/application/auth_notifier.dart';
import 'package:messenger_chat/auth/infra/firebase_auth_services.dart';
import 'package:messenger_chat/core/shared/providers.dart';

final firebaseAuthServiceProvider = Provider<FirebaseAuthServices>(
  (ref) {
    return FirebaseAuthServices(
      ref.watch(firebseAuthProvider),
      ref.watch(firebaseFirestoreProvider),
    );
  },
);

final authNotifierProvider = Provider<AuthNotifier>(
  (ref) {
    return AuthNotifier(
      ref.watch(firebaseAuthServiceProvider),
    );
  },
);
