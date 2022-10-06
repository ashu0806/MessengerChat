import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';

class LogInPage extends StatefulHookConsumerWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogInPageState();
}

class _LogInPageState extends ConsumerState<LogInPage> {
  @override
  Widget build(BuildContext context) {
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
          "Enter your mobile number",
          style: Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 17.sp,
                color: AppConstant.appwhite,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
