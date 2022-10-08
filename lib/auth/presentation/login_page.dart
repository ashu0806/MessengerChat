import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/core/widgets/custom_button.dart';

class LogInPage extends StatefulHookConsumerWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogInPageState();
}

class _LogInPageState extends ConsumerState<LogInPage> {
  Country? country;
  @override
  Widget build(BuildContext context) {
    var phoneController = useTextEditingController();
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
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
                vertical: 15.h,
              ),
              child: Text(
                "Messenger Chat will need to verify your number",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppConstant.appBlack,
                    ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              showCountryPicker(
                context: context,
                onSelect: (value) {
                  setState(() {
                    country = value;
                  });
                },
              );
            },
            child: const Text(
              "Pick Country",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (country != null)
                Text(
                  '+${country!.phoneCode}',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18.sp,
                      ),
                ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                height: 30.h,
                width: 200.w,
                alignment: Alignment.center,
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "phone number",
                    hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.sp,
                        ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 130.w,
            child: CustomButtonWidget(
              onTap: () {},
              backgroundColor: AppConstant.primaryColor,
              text: "Next",
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
