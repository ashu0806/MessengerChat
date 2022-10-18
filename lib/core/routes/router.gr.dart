// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../auth/presentation/login_page.dart' as _i3;
import '../../auth/presentation/otp_page.dart' as _i4;
import '../../auth/presentation/user_info_page.dart' as _i5;
import '../../getContacts/presentation/select_contact_page.dart' as _i8;
import '../../chat/presentation/chat_page.dart' as _i7;
import '../../home/presentation/home_page.dart' as _i6;
import '../../landing/landing_page.dart' as _i2;
import '../../splash_page.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LandingRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.LandingPage(),
        transitionsBuilder: _i9.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LogInRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.LogInPage(),
        transitionsBuilder: _i9.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.OtpPage(
          key: args.key,
          verificationCode: args.verificationCode,
        ),
        transitionsBuilder: _i9.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserInfoRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.UserInfoPage(),
        transitionsBuilder: _i9.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
        transitionsBuilder: _i9.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.ChatPage(
          key: args.key,
          userName: args.userName,
          userId: args.userId,
        ),
        transitionsBuilder: _i9.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SelectContactRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.SelectContactPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          LandingRoute.name,
          path: '/landing-page',
        ),
        _i9.RouteConfig(
          LogInRoute.name,
          path: '/log-in-page',
        ),
        _i9.RouteConfig(
          OtpRoute.name,
          path: '/otp-page',
        ),
        _i9.RouteConfig(
          UserInfoRoute.name,
          path: '/user-info-page',
        ),
        _i9.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i9.RouteConfig(
          ChatRoute.name,
          path: '/chat-page',
        ),
        _i9.RouteConfig(
          SelectContactRoute.name,
          path: '/select-contact-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LandingPage]
class LandingRoute extends _i9.PageRouteInfo<void> {
  const LandingRoute()
      : super(
          LandingRoute.name,
          path: '/landing-page',
        );

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i3.LogInPage]
class LogInRoute extends _i9.PageRouteInfo<void> {
  const LogInRoute()
      : super(
          LogInRoute.name,
          path: '/log-in-page',
        );

  static const String name = 'LogInRoute';
}

/// generated route for
/// [_i4.OtpPage]
class OtpRoute extends _i9.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i10.Key? key,
    required String verificationCode,
  }) : super(
          OtpRoute.name,
          path: '/otp-page',
          args: OtpRouteArgs(
            key: key,
            verificationCode: verificationCode,
          ),
        );

  static const String name = 'OtpRoute';
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.verificationCode,
  });

  final _i10.Key? key;

  final String verificationCode;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, verificationCode: $verificationCode}';
  }
}

/// generated route for
/// [_i5.UserInfoPage]
class UserInfoRoute extends _i9.PageRouteInfo<void> {
  const UserInfoRoute()
      : super(
          UserInfoRoute.name,
          path: '/user-info-page',
        );

  static const String name = 'UserInfoRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.ChatPage]
class ChatRoute extends _i9.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i10.Key? key,
    required String userName,
    required String userId,
  }) : super(
          ChatRoute.name,
          path: '/chat-page',
          args: ChatRouteArgs(
            key: key,
            userName: userName,
            userId: userId,
          ),
        );

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.userName,
    required this.userId,
  });

  final _i10.Key? key;

  final String userName;

  final String userId;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, userName: $userName, userId: $userId}';
  }
}

/// generated route for
/// [_i8.SelectContactPage]
class SelectContactRoute extends _i9.PageRouteInfo<void> {
  const SelectContactRoute()
      : super(
          SelectContactRoute.name,
          path: '/select-contact-page',
        );

  static const String name = 'SelectContactRoute';
}
