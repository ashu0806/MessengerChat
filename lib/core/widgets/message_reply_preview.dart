import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/chat/widgets/display_chat_message.dart';
import 'package:messenger_chat/core/shared/providers.dart';

class MessageReplyPreviewWidget extends HookConsumerWidget {
  const MessageReplyPreviewWidget({super.key});

  void cancelReply(WidgetRef ref) {
    ref.read(messageReplyProvider.state).update(
          (state) => null,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageReply = ref.watch(messageReplyProvider);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 5.h,
      ),
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.all(
          8.sm,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 214, 214, 214),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              10.r,
            ),
            topRight: Radius.circular(
              10.r,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageReply!.isMe ? "Me" : "Opposite",
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
              ),
              Divider(
                color: Colors.black,
                height: 15.h,
                thickness: 1.w,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.h,
                      width: 1.sw,
                      padding: EdgeInsets.all(
                        5.sm,
                      ),
                      alignment: Alignment.centerLeft,
                      child: DisplayChatMessage(
                        message: messageReply.message,
                        type: messageReply.messageEnum,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => cancelReply(ref),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15.r,
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
