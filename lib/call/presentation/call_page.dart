// ignore_for_file: use_build_context_synchronously

import 'package:agora_uikit/agora_uikit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/call/domain/callModel/call_model.dart';
import 'package:messenger_chat/call/shared/providers.dart';
import 'package:messenger_chat/config/agora_config.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';

class CallPage extends ConsumerStatefulWidget {
  const CallPage({
    super.key,
    required this.channelId,
    required this.callModel,
    required this.isGroupChat,
  });
  final String channelId;
  final CallModel callModel;
  final bool isGroupChat;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CallPageState();
}

class _CallPageState extends ConsumerState<CallPage> {
  AgoraClient? client;

  String baseUrl = 'https://social-messenger-chat.herokuapp.com/';
  @override
  void initState() {
    super.initState();
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: AgoraConfig.appId,
        channelName: widget.channelId,
        tokenUrl: baseUrl,
      ),
    );
    initializeAgora();
  }

  void initializeAgora() async {
    await client!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: client == null
          ? AppConstant.showLoader(
              context,
              "Loading",
            )
          : SafeArea(
              child: Stack(
                children: [
                  AgoraVideoViewer(client: client!),
                  AgoraVideoButtons(
                    client: client!,
                    disconnectButtonChild: InkWell(
                      onTap: () async {
                        await client!.engine.leaveChannel();
                        ref.read(callNotifierProvider).endCall(
                              widget.callModel.callerId,
                              widget.callModel.receiverId,
                              context,
                              widget.isGroupChat,
                            );
                        AutoRouter.of(context).pop();
                      },
                      child: CircleAvatar(
                        radius: 25.r,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.call_end,
                          size: 25.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
