import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/home/demo/contact_info.dart';
import 'package:messenger_chat/home/widgets/chat_list_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.primaryColor,
          title: Text(
            info[0]["name"].toString(),
          ), 
          centerTitle: false,
          leading: InkWell(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 20.sp,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.video_call_rounded,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
              ),
            ),
          ],
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: Column(
            children: [
              const Expanded(
                child: ChatListWidget(),
              ),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.attach_file,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: TextField(
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
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mic,
                        color: Colors.white,
                      ),
                    ),
                    const CircleAvatar(
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
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
