import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmedStatusPage extends HookConsumerWidget {
  const ConfirmedStatusPage({
    super.key,
    required this.pickedFile,
  });
  final File pickedFile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.file(pickedFile),
          ),
        ),
      ),
    );
  }
}
