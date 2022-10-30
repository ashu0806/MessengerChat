import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/core/widgets/error.dart';
import 'package:messenger_chat/getContacts/shared/providers.dart';
import 'package:messenger_chat/group/shared/providers.dart';

class SelectGroupContactsWidget extends ConsumerStatefulWidget {
  const SelectGroupContactsWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectGroupContactsWidgetState();
}

class _SelectGroupContactsWidgetState
    extends ConsumerState<SelectGroupContactsWidget> {
  List<int> selectedContactsIndex = [];

  void selectContacts(
    Contact contact,
    int index,
  ) {
    if (selectedContactsIndex.contains(index)) {
      selectedContactsIndex.remove(index);
    } else {
      selectedContactsIndex.add(index);
    }
    setState(() {});
    ref.read(selectGroupContactProvider.state).update(
          (state) => [...state, contact],
        );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(getContactsFutureProvider).when(
      data: (contactList) {
        return Expanded(
          child: ListView.builder(
            itemCount: contactList.length,
            itemBuilder: (context, index) {
              final contact = contactList[index];
              return InkWell(
                onTap: () => selectContacts(
                  contact,
                  index,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 5.h,
                  ),
                  child: Container(
                    height: 45.h,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: selectedContactsIndex.contains(index)
                            ? const Color.fromARGB(255, 149, 200, 241)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(
                          10.r,
                        )),
                    child: ListTile(
                      title: Text(
                        contact.displayName,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                      ),
                      leading: selectedContactsIndex.contains(index)
                          ? IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.done,
                                color: AppConstant.primaryColordark,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              );
            },
          ),
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
    );
  }
}
