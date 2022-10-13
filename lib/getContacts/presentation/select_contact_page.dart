import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/core/widgets/error.dart';
import 'package:messenger_chat/getContacts/shared/providers.dart';

class SelectContactPage extends ConsumerWidget {
  const SelectContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(getContactsFutureProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.primaryColor,
          title: Text(
            "Select Contact",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          centerTitle: true,
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
                Icons.search,
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
        body: contacts.when(
          data: (contacts) {
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                var contact = contacts[index];
                return InkWell(
                  onTap: () {
                    ref.watch(contactsNotifierProvider).selectContact(
                          context,
                          contact,
                        );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 5.h,
                    ),
                    child: ListTile(
                      title: Text(
                        contact.displayName,
                      ),
                      leading: contact.photo == null
                          ? CircleAvatar(
                              radius: 20.r,
                              backgroundColor: Colors.grey,
                              backgroundImage: const NetworkImage(
                                'https://tse4.mm.bing.net/th?id=OIP.DxdqBFLVLPcWsjkds8636QHaHf&pid=Api&P=0',
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: MemoryImage(
                                contact.photo!,
                              ),
                            ),
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) {
            return ErrorShowWidget(
              errorMsg: error.toString(),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
