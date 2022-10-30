import 'package:auto_route/auto_route.dart';
import 'package:messenger_chat/auth/presentation/login_page.dart';
import 'package:messenger_chat/auth/presentation/otp_page.dart';
import 'package:messenger_chat/call/presentation/call_page.dart';
import 'package:messenger_chat/getContacts/presentation/select_contact_page.dart';
import 'package:messenger_chat/chat/presentation/chat_page.dart';
import 'package:messenger_chat/group/presentation/create_group_page.dart';
import 'package:messenger_chat/home/home_page.dart';
import 'package:messenger_chat/landing/landing_page.dart';
import 'package:messenger_chat/splash_page.dart';
import 'package:messenger_chat/auth/presentation/user_info_page.dart';
import 'package:messenger_chat/status/presentation/confirmed_status_page.dart';
import 'package:messenger_chat/status/presentation/status_viewed_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CustomRoute(
      page: SplashPage,
      initial: true,
    ),
    CustomRoute(
      page: LandingPage,
      transitionsBuilder: TransitionsBuilders.zoomIn,
    ),
    CustomRoute(
      page: LogInPage,
      transitionsBuilder: TransitionsBuilders.zoomIn,
    ),
    CustomRoute(
      page: OtpPage,
      transitionsBuilder: TransitionsBuilders.zoomIn,
    ),
    CustomRoute(
      page: UserInfoPage,
      transitionsBuilder: TransitionsBuilders.zoomIn,
    ),
    CustomRoute(
      page: HomePage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      page: ChatPage,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
    ),
    CustomRoute(
      page: SelectContactPage,
    ),
    CustomRoute(
      page: ConfirmedStatusPage,
    ),
    CustomRoute(
      page: StatusViewedPage,
      transitionsBuilder: TransitionsBuilders.zoomIn,
    ),
    CustomRoute(
      page: CreateGroupPage,
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
    ),
    CustomRoute(
      page: CallPage,
    ),
  ],
)
class $AppRouter {}
