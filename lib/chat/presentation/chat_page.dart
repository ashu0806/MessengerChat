import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/auth/domain/userModel/user_model.dart';
import 'package:messenger_chat/auth/shared/providers.dart';
import 'package:messenger_chat/chat/widgets/interactive_message_bottom_field.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/home/widgets/chat_list_widget.dart';

class ChatPage extends StatefulHookConsumerWidget {
  const ChatPage({
    super.key,
    required this.userName,
    required this.userId,
  });
  final String userName;
  final String userId;

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.primaryColor,
          title: StreamBuilder<UserModel>(
            stream: ref.read(authNotifierProvider).fetchData(
                  widget.userId,
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
                    widget.userName,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
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
                    style: Theme.of(context).textTheme.headline5!.copyWith(
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
              InteractiveMessageBottomField(
                receiverUserId: widget.userId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
