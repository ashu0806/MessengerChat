import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/group/shared/providers.dart';
import 'package:messenger_chat/group/widgets/select_group_contacts.dart';

class CreateGroupPage extends ConsumerStatefulWidget {
  const CreateGroupPage({super.key});

  @override
  ConsumerState<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends ConsumerState<CreateGroupPage> {
  File? image;
  var groupNameController = TextEditingController();
  void selectImage() async {
    image = await AppConstant.pickImageFromGallery(context);
    setState(() {});
  }

  void createGroup() {
    if (groupNameController.text.trim().isNotEmpty && image != null) {
      ref.read(groupNotifierProvider).createGroup(
            context,
            groupNameController.text.trim(),
            image!,
            ref.read(selectGroupContactProvider),
          );
      ref.read(selectGroupContactProvider.state).update(
            (state) => [],
          );
      AutoRouter.of(context).pop();
    }
  }

  @override
  void dispose() {
    groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.primaryColor,
          title: const Text(
            "Create Group",
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              AutoRouter.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  image == null
                      ? CircleAvatar(
                          radius: 60.r,
                          backgroundColor:
                              const Color.fromARGB(255, 133, 133, 133),
                          backgroundImage: const NetworkImage(
                            'https://tse4.mm.bing.net/th?id=OIP.DxdqBFLVLPcWsjkds8636QHaHf&pid=Api&P=0',
                          ),
                        )
                      : CircleAvatar(
                          radius: 60.r,
                          backgroundColor: Colors.grey,
                          backgroundImage: FileImage(
                            image!,
                          ),
                        ),
                  Positioned(
                    left: 70.w,
                    bottom: -10.h,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                        size: 25.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: TextField(
                  controller: groupNameController,
                  decoration: const InputDecoration(
                    hintText: "Enter group name",
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 8.h,
                ),
                child: Text(
                  "Select Contacts",
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 17.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              const SelectGroupContactsWidget(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createGroup,
          backgroundColor: AppConstant.primaryColor,
          child: const Icon(
            Icons.done,
          ),
        ),
      ),
    );
  }
}
