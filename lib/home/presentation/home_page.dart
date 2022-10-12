import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late TabController tabBarController;
  @override
  void initState() {
    super.initState();
    tabBarController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  //   switch (state) {
  //     case AppLifecycleState.resumed:
  //       ref.read(authControllerProvider).setUserState(true);
  //       break;
  //     case AppLifecycleState.inactive:
  //     case AppLifecycleState.detached:
  //     case AppLifecycleState.paused:
  //       ref.read(authControllerProvider).setUserState(false);
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        notification.disallowIndicator();
        return true;
      },
      child: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppConstant.primaryColor,
              centerTitle: false,
              title: Text(
                'Messenger Chat',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppConstant.appwhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: AppConstant.appwhite,
                  ),
                  onPressed: () {},
                ),
                PopupMenuButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppConstant.appwhite,
                  ),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text(
                        'Create Group',
                      ),
                      // onTap: () => Future(
                      //   () => Navigator.pushNamed(
                      //       context, CreateGroupScreen.routeName),
                      // ),
                    )
                  ],
                ),
              ],
              bottom: TabBar(
                controller: tabBarController,
                indicatorColor: Colors.grey,
                indicatorWeight: 5,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: AppConstant.appwhite,
                unselectedLabelColor: AppConstant.appwhite,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                tabs: const [
                  Tab(
                    text: 'CHATS',
                  ),
                  Tab(
                    text: 'STATUS',
                  ),
                  Tab(
                    text: 'CALLS',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: tabBarController,
              children: const [
                Center(
                  child: Text('Chats'),
                ),
                Center(
                  child: Text('Status'),
                ),
                Center(
                  child: Text('Calls'),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                if (tabBarController.index == 0) {
                  // Navigator.pushNamed(context, SelectContactsScreen.routeName);
                } else {
                  File? pickedImage =
                      await AppConstant.pickImageFromGallery(context);
                  if (pickedImage != null) {
                    // Navigator.pushNamed(
                    //   context,
                    //   ConfirmStatusScreen.routeName,
                    //   arguments: pickedImage,
                    // );
                  }
                }
              },
              backgroundColor: AppConstant.primaryColordark,
              child: const Icon(
                Icons.comment,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
