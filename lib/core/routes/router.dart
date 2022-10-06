import 'package:auto_route/annotations.dart';
import 'package:messenger_chat/auth/presentation/login_page.dart';
import 'package:messenger_chat/landing/landing_page.dart';
import 'package:messenger_chat/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      page: LandingPage,
    ),
    AutoRoute(
      page: LogInPage,
    ),
  ],
)
class $AppRouter {}
