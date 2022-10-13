import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';

class SenderMessageCard extends StatelessWidget {
  const SenderMessageCard({
    super.key,
    required this.message,
    required this.time,
  });
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8.r,
            ),
          ),
          color: AppConstant.primaryColordark,
          margin: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 5.h,
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 30.w,
                  top: 5.h,
                  bottom: 20.h,
                ),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.white,
                        fontSize: 13.sp,
                      ),
                ),
              ),
              Positioned(
                bottom: 2.h,
                right: 10.w,
                child: Row(
                  children: [
                    Text(
                      time,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.grey,
                            fontSize: 13.sp,
                          ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.done_all,
                      color: Colors.grey,
                      size: 16.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
