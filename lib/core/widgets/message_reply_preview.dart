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
    return Container(
      width: 310.w,
      padding: EdgeInsets.all(
        8.sm,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
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
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    messageReply!.isMe ? "Me" : "Opposite",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                  ),
                ),
                InkWell(
                  onTap: () => cancelReply(ref),
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            DisplayChatMessage(
              message: messageReply.message,
              type: messageReply.messageEnum,
            ),
          ],
        ),
      ),
    );
  }
}
