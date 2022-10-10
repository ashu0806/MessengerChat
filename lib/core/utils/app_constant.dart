import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

mixin AppConstant {
  static const Color primaryColor = Color.fromARGB(255, 76, 3, 145);
  static const Color secondaryColor = Color.fromARGB(255, 106, 9, 197);
  static const Color primaryColordark = Color.fromARGB(255, 63, 5, 102);
  static const Color subtitle1color = Color.fromARGB(255, 65, 62, 62);
  static const Color appBlack = Color.fromARGB(255, 0, 0, 0);
  static const Color appwhite = Color.fromARGB(255, 255, 255, 255);

  static showLoader(context, String message, {Color? color}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: 60.h,
            width: 260.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                12.r,
              ),
            ),
            child: Row(
              children: [
                Lottie.asset(
                  'assets/loading.json',
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: Text(
                    message,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static showSnackbar(context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(
        message,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15.r,
        ),
      ),
      backgroundColor: color,
      duration: const Duration(
        seconds: 2,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<File?> pickImageFromGallery(BuildContext context) async {
    File? image;

    try {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    } catch (e) {
      AppConstant.showSnackbar(
        context,
        e.toString(),
        Colors.black,
      );
    }
    return image;
  }
}
