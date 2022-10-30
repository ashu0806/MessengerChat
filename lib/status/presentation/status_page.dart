import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/core/routes/router.gr.dart';
import 'package:messenger_chat/status/domain/statusModel/status_model.dart';
import 'package:messenger_chat/status/shared/providers.dart';

class StatusPage extends ConsumerWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<StatusModel>>(
      future: ref.read(statusNotifierProvider).getStatus(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var statusData = snapshot.data![index];
            return InkWell(
              onTap: () {
                AutoRouter.of(context).push(
                  StatusViewedRoute(
                    status: statusData,
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 8.h,
                  top: 8.h,
                ),
                child: ListTile(
                  title: Text(
                    statusData.userName,
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      statusData.profilePic,
                    ),
                    radius: 30.r,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
