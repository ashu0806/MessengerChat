import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/shared/providers.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/core/widgets/custom_button.dart';

class UserInfoPage extends StatefulHookConsumerWidget {
  const UserInfoPage({super.key});

  @override
  ConsumerState<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends ConsumerState<UserInfoPage> {
  var nameController = TextEditingController();
  File? image;
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  void selectImage() async {
    image = await AppConstant.pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserData() async {
    String name = nameController.text.trim();

    if (name.isNotEmpty) {
      AppConstant.showLoader(
        context,
        "Loading",
      );
      ref.read(authNotifierProvider).sendDataToFirebase(
            context,
            name,
            image,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Stack(
                children: [
                  image == null
                      ? CircleAvatar(
                          radius: 55.r,
                          backgroundColor: Colors.grey,
                          backgroundImage: const NetworkImage(
                            'https://tse4.mm.bing.net/th?id=OIP.DxdqBFLVLPcWsjkds8636QHaHf&pid=Api&P=0',
                          ),
                        )
                      : CircleAvatar(
                          radius: 55.r,
                          backgroundColor: Colors.grey,
                          backgroundImage: FileImage(
                            image!,
                          ),
                        ),
                  Positioned(
                    left: 60.w,
                    bottom: -8.h,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                        size: 25.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: "Enter your name",
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              width: 130.w,
              child: CustomButtonWidget(
                onTap: nameController.text.isEmpty
                    ? () {
                        AppConstant.showSnackbar(
                          context,
                          "Name is required",
                          Colors.black,
                        );
                      }
                    : storeUserData,
                backgroundColor: nameController.text.isEmpty
                    ? Colors.grey
                    : AppConstant.primaryColor,
                text: "Update",
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
