import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:messenger_chat/core/routes/router.gr.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        Future.delayed(
          const Duration(seconds: 3),
          () {
            AutoRouter.of(context).pushAndPopUntil(
              const LandingRoute(),
              predicate: (route) => false,
            );
          },
        );
        return null;
      },
      [],
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Messenger Chat",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(221, 83, 16, 100),
                  ),
            ),
            Lottie.asset(
              'assets/splash_page.json',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
