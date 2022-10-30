import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/core/shared/providers.dart';
import 'package:messenger_chat/status/application/status_notifier.dart';
import 'package:messenger_chat/status/infra/status_services.dart';

final statusServiceProvider = Provider<StatusServices>(
  (ref) {
    return StatusServices(
      ref.watch(firebaseAuthProvider),
      ref.watch(firebaseFirestoreProvider),
      ref,
    );
  },
);

final statusNotifierProvider = Provider<StatusNotifier>(
  (ref) {
    return StatusNotifier(
      ref.read(statusServiceProvider),
      ref,
    );
  },
);
