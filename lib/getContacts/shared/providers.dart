import 'package:flutter_contacts/contact.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/core/shared/providers.dart';
import 'package:messenger_chat/getContacts/application/contacts_notifier.dart';
import 'package:messenger_chat/getContacts/infra/get_contact_services.dart';

final getContactsServiceProvider = Provider<GetContactServices>(
  (ref) {
    return GetContactServices(
      ref.watch(firebaseFirestoreProvider),
    );
  },
);

final getContactsFutureProvider = FutureProvider<List<Contact>>(
  (ref) async {
    final contacts = ref.watch(getContactsServiceProvider).getContactList();
    return contacts;
  },
);

final contactsNotifierProvider = Provider(
  (ref) {
    return ContactsNotifier(
      ref.watch(getContactsServiceProvider),
    );
  },
);
