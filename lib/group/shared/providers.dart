import 'package:flutter_contacts/contact.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/core/shared/providers.dart';
import 'package:messenger_chat/group/application/group_notifier.dart';
import 'package:messenger_chat/group/infra/group_services.dart';

final selectGroupContactProvider = StateProvider<List<Contact>>(
  (ref) {
    return [];
  },
);

final groupServicesProvider = Provider<GroupServices>(
  (ref) {
    return GroupServices(
      ref.watch(firebaseFirestoreProvider),
      ref.watch(firebaseAuthProvider),
      ref,
    );
  },
);

final groupNotifierProvider = Provider<GroupNotifier>(
  (ref) {
    return GroupNotifier(
      ref.watch(groupServicesProvider),
      ref,
    );
  },
);
