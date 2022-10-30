import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/call/domain/callModel/call_model.dart';
import 'package:messenger_chat/call/shared/providers.dart';
import 'package:messenger_chat/core/routes/router.gr.dart';

class CallPickUpPage extends HookConsumerWidget {
  const CallPickUpPage({
    super.key,
    required this.scaffold,
  });
  final Widget scaffold;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<DocumentSnapshot>(
      stream: ref.read(callNotifierProvider).callStream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.data() != null) {
          CallModel callModel =
              CallModel.fromMap(snapshot.data!.data() as Map<String, dynamic>);

          if (!callModel.hasDialed) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 2, 2, 2),
              body: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 120.h,
                    ),
                    Text(
                      "Incoming Call.....",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 25.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CircleAvatar(
                      radius: 60.r,
                      backgroundImage: NetworkImage(
                        callModel.callerPic,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      callModel.callerName,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 25.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 60.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 35.r,
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.call_end,
                                size: 35.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              AutoRouter.of(context).push(
                                CallRoute(
                                  channelId: callModel.callId,
                                  callModel: callModel,
                                  isGroupChat: false,
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 35.r,
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.call,
                                size: 35.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
        return scaffold;
      },
    );
  }
}
