import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:messenger_chat/chat/domain/chatContactModel/chat_contact_model.dart';
import 'package:messenger_chat/chat/shared/providers.dart';
import 'package:messenger_chat/core/routes/router.gr.dart';

class ContactListWidget extends HookConsumerWidget {
  const ContactListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 5.h,
      ),
      child: StreamBuilder<List<ChatContactModel>>(
        stream: ref.watch(chatNotifierProvider).chatContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var chatContact = snapshot.data![index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 4.h,
                  ),
                  child: InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(
                        ChatRoute(
                          userName: chatContact.name,
                          userId: chatContact.contactId,
                        ),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 23.r,
                        backgroundImage: NetworkImage(
                          chatContact.profilePic,
                        ),
                      ),
                      title: Text(
                        chatContact.name,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      subtitle: Text(
                        chatContact.lastMessage,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 14.sp,
                              color: const Color.fromARGB(255, 39, 39, 39),
                            ),
                      ),
                      trailing: Text(
                        DateFormat.Hm().format(chatContact.sentTime),
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 13.sp,
                              color: Colors.grey,
                            ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text("Error");
          } else {
            return const Text("No data");
          }
        },
      ),
    );
  }
}
