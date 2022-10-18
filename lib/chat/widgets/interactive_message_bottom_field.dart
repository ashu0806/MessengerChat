import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/chat/shared/providers.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';

class InteractiveMessageBottomField extends StatefulHookConsumerWidget {
  const InteractiveMessageBottomField({
    Key? key,
    required this.receiverUserId,
  }) : super(key: key);
  final String receiverUserId;

  @override
  ConsumerState<InteractiveMessageBottomField> createState() =>
      _InteractiveMessageBottomFieldState();
}

class _InteractiveMessageBottomFieldState
    extends ConsumerState<InteractiveMessageBottomField> {
  bool isChanged = false;
  final messageController = TextEditingController();

  void sendMessage() async {
    if (isChanged) {
      ref.read(chatNotifierProvider).sendMessage(
            context,
            messageController.text.trim(),
            widget.receiverUserId,
          );
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      padding: EdgeInsets.all(
        10.sm,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            5.r,
          ),
          topRight: Radius.circular(
            5.r,
          ),
        ),
        color: AppConstant.primaryColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20.w,
            height: 20.h,
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          SizedBox(
            width: 20.w,
            height: 20.h,
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.attach_file,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: TextField(
              controller: messageController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    isChanged = true;
                  });
                } else {
                  setState(() {
                    isChanged = false;
                  });
                }
              },
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 232, 231, 231),
                filled: true,
                hintText: "Type a message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: EdgeInsets.only(
                  left: 10.w,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          CircleAvatar(
            child: InkWell(
              onTap: sendMessage,
              child: Icon(
                isChanged ? Icons.send : Icons.mic,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
