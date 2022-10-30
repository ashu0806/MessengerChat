import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/domain/userModel/user_model.dart';
import 'package:messenger_chat/auth/shared/providers.dart';
import 'package:messenger_chat/call/presentation/call_pickup_page.dart';
import 'package:messenger_chat/call/shared/providers.dart';
import 'package:messenger_chat/chat/widgets/interactive_message_bottom_field.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/chat/widgets/chat_list_widget.dart';

class ChatPage extends HookConsumerWidget {
  const ChatPage({
    super.key,
    required this.name,
    required this.id,
    required this.isGroupChat,
    required this.profilePic,
  });
  final String name;
  final String id;
  final bool isGroupChat;
  final String profilePic;

  void makeCall(
    WidgetRef ref,
    BuildContext context,
  ) {
    ref.read(callNotifierProvider).makeCall(
          context,
          name,
          id,
          profilePic,
          isGroupChat,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: CallPickUpPage(
        scaffold: Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.primaryColor,
            title: isGroupChat
                ? Text(
                    name,
                  )
                : StreamBuilder<UserModel>(
                    stream: ref.read(authNotifierProvider).fetchData(
                          id,
                        ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            snapshot.data!.isOnline ? "online" : "offline",
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontSize: 13.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      );
                    },
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
                onPressed: () => makeCall(
                  ref,
                  context,
                ),
                icon: const Icon(
                  CupertinoIcons.videocam_fill,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.phone_circle_fill,
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
                Expanded(
                  child: ChatListWidget(
                    receiverUserId: id,
                    isGroupChat: isGroupChat,
                  ),
                ),
                InteractiveMessageBottomField(
                  receiverUserId: id,
                  isGroupChat: isGroupChat,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
