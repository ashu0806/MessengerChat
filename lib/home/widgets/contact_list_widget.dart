import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_chat/core/routes/router.gr.dart';
import 'package:messenger_chat/home/demo/contact_info.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 5.h,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: 4.h,
            ),
            child: InkWell(
              onTap: () {
                AutoRouter.of(context).push(
                  const ChatRoute(),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 23.r,
                  backgroundImage: NetworkImage(
                    info[index]["profilePic"].toString(),
                  ),
                ),
                title: Text(
                  info[index]['name'].toString(),
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                subtitle: Text(
                  info[index]['message'].toString(),
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 14.sp,
                        color: const Color.fromARGB(255, 39, 39, 39),
                      ),
                ),
                trailing: Text(
                  info[index]['time'].toString(),
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 13.sp,
                        color: Colors.grey,
                      ),
                ),
              ),
            ),
          );
        },
        itemCount: info.length,
      ),
    );
  }
}
