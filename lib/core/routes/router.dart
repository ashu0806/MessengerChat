import 'package:auto_route/auto_route.dart';
import 'package:messenger_chat/auth/presentation/login_page.dart';
import 'package:messenger_chat/auth/presentation/otp_page.dart';
import 'package:messenger_chat/getContacts/presentation/select_contact_page.dart';
import 'package:messenger_chat/home/presentation/chat_page.dart';
import 'package:messenger_chat/home/presentation/home_page.dart';
import 'package:messenger_chat/landing/landing_page.dart';
import 'package:messenger_chat/splash_page.dart';
import 'package:messenger_chat/auth/presentation/user_info_page.dart';

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
  ],
)
class $AppRouter {}
