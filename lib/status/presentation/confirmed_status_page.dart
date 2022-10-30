import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/status/shared/providers.dart';

class ConfirmedStatusPage extends HookConsumerWidget {
  const ConfirmedStatusPage({
    super.key,
    required this.pickedFile,
  });
  final File pickedFile;

  void addStatus(WidgetRef ref, BuildContext context) {
    ref.read(statusNotifierProvider).addStatus(
          context,
          pickedFile,
        );
    AutoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: Image.file(
              pickedFile,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addStatus(
            ref,
            context,
          ),
          backgroundColor: AppConstant.primaryColor,
          child: const Icon(
            Icons.done,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
