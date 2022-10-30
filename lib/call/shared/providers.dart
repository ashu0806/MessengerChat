import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/call/application/call_notifier.dart';
import 'package:messenger_chat/call/infra/call_services.dart';
import 'package:messenger_chat/core/shared/providers.dart';

final callServicesProvider = Provider<CallServices>(
  (ref) {
    return CallServices(
      ref.watch(firebaseAuthProvider),
      ref.watch(firebaseFirestoreProvider),
    );
  },
);

final callNotifierProvider = Provider<CallNotifier>(
  (ref) {
    return CallNotifier(
      ref.watch(callServicesProvider),
      ref,
      ref.watch(firebaseAuthProvider),
    );
  },
);
