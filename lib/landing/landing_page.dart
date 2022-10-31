import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_chat/core/routes/router.gr.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/core/widgets/custom_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            20.sm,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: Text(
                    "Welcome to Messenger Chat",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 23.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/landingPage/bg.png',
                  color: const Color.fromARGB(255, 1, 36, 2),
                  fit: BoxFit.contain,
                ),
                const Spacer(),
                Text(
                  'Read our Privacy Policy. Tap "Agree and Continue" to accept the Terms and Conditions.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 15.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 230.w,
                  child: CustomButtonWidget(
                    text: "Agree and Continue",
                    onTap: () {
                      AutoRouter.of(context).push(
                        const LogInRoute(),
                      );
                    },
                    backgroundColor: AppConstant.secondaryColor,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
