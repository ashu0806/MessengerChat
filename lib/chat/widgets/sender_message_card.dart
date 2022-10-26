import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_chat/chat/widgets/display_chat_message.dart';
import 'package:messenger_chat/core/shared/message_enum.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:swipe_to/swipe_to.dart';

class SenderMessageCard extends StatelessWidget {
  const SenderMessageCard({
    super.key,
    required this.message,
    required this.time,
    required this.type,
    required this.onSwipeRight,
    required this.repliedText,
    required this.userName,
    required this.repliedMessageType,
    required this.isSeen,
  });
  final String message;
  final String time;
  final MessageEnum type;
  final VoidCallback onSwipeRight;
  final String repliedText;
  final String userName;
  final MessageEnum repliedMessageType;
  final bool isSeen;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isReplying = repliedText.isNotEmpty;
    return SwipeTo(
      onRightSwipe: onSwipeRight,
      child: Align(
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
            color: AppConstant.primaryColor,
            margin: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 5.h,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: type == MessageEnum.text
                      ? EdgeInsets.only(
                          left: 10.w,
                          right: 30.w,
                          top: 5.h,
                          bottom: 20.h,
                        )
                      : EdgeInsets.only(
                          left: 5.w,
                          right: 5.w,
                          top: 5.h,
                          bottom: 25.h,
                        ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isReplying) ...[
                          Text(
                            userName,
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              8.sm,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                8.r,
                              ),
                              color: Colors.black.withOpacity(0.2),
                            ),
                            child: DisplayChatMessage(
                              message: repliedText,
                              type: repliedMessageType,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                        DisplayChatMessage(
                          message: message,
                          type: type,
                        ),
                      ],
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
                        isSeen ? Icons.done_all : Icons.done,
                        color: isSeen ? Colors.blue : Colors.black,
                        size: 16.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
