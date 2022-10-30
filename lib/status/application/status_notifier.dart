import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/shared/providers.dart';
import 'package:messenger_chat/status/domain/statusModel/status_model.dart';
import 'package:messenger_chat/status/infra/status_services.dart';

class StatusNotifier {
  final StatusServices services;
  final ProviderRef ref;

  StatusNotifier(
    this.services,
    this.ref,
  );

  void addStatus(
    BuildContext context,
    File file,
  ) {
    ref.watch(userDataProvider).whenData(
      (value) {
        services.uploadStatus(
          context,
          value!.name,
          value.profilePic,
          value.phoneNumber,
          file,
        );
      },
    );
  }

  Future<List<StatusModel>> getStatus(
    BuildContext context,
  ) async {
    return services.getStatus(
      context,
    );
  }
}
