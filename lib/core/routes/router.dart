import 'package:auto_route/auto_route.dart';
import 'package:messenger_chat/auth/presentation/login_page.dart';
import 'package:messenger_chat/landing/landing_page.dart';
import 'package:messenger_chat/splash_page.dart';

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
  ],
)
class $AppRouter {}
