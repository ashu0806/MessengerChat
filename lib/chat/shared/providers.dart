import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/chat/application/chat_notifier.dart';
import 'package:messenger_chat/chat/infra/chat_services.dart';
import 'package:messenger_chat/core/shared/providers.dart';

final chatServiceProvider = Provider<ChatServices>(
  (ref) {
    return ChatServices(
      ref.watch(firebaseFirestoreProvider),
      ref.watch(firebseAuthProvider),
    );
  },
);

final chatNotifierProvider = Provider<ChatNotifier>(
  (ref) {
    return ChatNotifier(
      ref.watch(chatServiceProvider),
      ref,
    );
  },
);
