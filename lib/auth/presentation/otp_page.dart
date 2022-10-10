import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/shared/providers.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';

class OtpPage extends ConsumerWidget {
  const OtpPage({
    Key? key,
    required this.verificationCode,
  }) : super(key: key);
  final String verificationCode;

  void verifyOTP(
    WidgetRef ref,
    BuildContext context,
    String userEnteredOtp,
  ) {
    ref.read(authNotifierProvider).verify(
          context,
          verificationCode,
          userEnteredOtp,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.secondaryColor,
        leading: InkWell(
          onTap: () {
            AutoRouter.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Verifying your mobile number",
          style: Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 17.sp,
                color: AppConstant.appwhite,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "We have sent an SMS with a code.",
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontSize: 17.sp,
                    color: AppConstant.appBlack,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 6) {
                    verifyOTP(
                      ref,
                      context,
                      value.trim(),
                    );
                  }
                },
                decoration: InputDecoration(
                  hintText: '-- -- -- -- -- --',
                  hintStyle: TextStyle(
                    fontSize: 25.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
