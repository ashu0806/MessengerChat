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
import 'dart:io' as _i12;

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../../auth/presentation/login_page.dart' as _i3;
import '../../auth/presentation/otp_page.dart' as _i4;
import '../../auth/presentation/user_info_page.dart' as _i5;
import '../../chat/presentation/chat_page.dart' as _i7;
import '../../getContacts/presentation/select_contact_page.dart' as _i8;
import '../../home/presentation/home_page.dart' as _i6;
import '../../landing/landing_page.dart' as _i2;
import '../../splash_page.dart' as _i1;
import '../../status/presentation/confirmed_status_page.dart' as _i9;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LandingRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.LandingPage(),
        transitionsBuilder: _i10.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LogInRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.LogInPage(),
        transitionsBuilder: _i10.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.OtpPage(
          key: args.key,
          verificationCode: args.verificationCode,
        ),
        transitionsBuilder: _i10.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserInfoRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.UserInfoPage(),
        transitionsBuilder: _i10.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
        transitionsBuilder: _i10.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.ChatPage(
          key: args.key,
          userName: args.userName,
          userId: args.userId,
        ),
        transitionsBuilder: _i10.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SelectContactRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.SelectContactPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ConfirmedStatusRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmedStatusRouteArgs>();
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: _i9.ConfirmedStatusPage(
          key: args.key,
          pickedFile: args.pickedFile,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          LandingRoute.name,
          path: '/landing-page',
        ),
        _i10.RouteConfig(
          LogInRoute.name,
          path: '/log-in-page',
        ),
        _i10.RouteConfig(
          OtpRoute.name,
          path: '/otp-page',
        ),
        _i10.RouteConfig(
          UserInfoRoute.name,
          path: '/user-info-page',
        ),
        _i10.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i10.RouteConfig(
          ChatRoute.name,
          path: '/chat-page',
        ),
        _i10.RouteConfig(
          SelectContactRoute.name,
          path: '/select-contact-page',
        ),
        _i10.RouteConfig(
          ConfirmedStatusRoute.name,
          path: '/confirmed-status-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LandingPage]
class LandingRoute extends _i10.PageRouteInfo<void> {
  const LandingRoute()
      : super(
          LandingRoute.name,
          path: '/landing-page',
        );

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i3.LogInPage]
class LogInRoute extends _i10.PageRouteInfo<void> {
  const LogInRoute()
      : super(
          LogInRoute.name,
          path: '/log-in-page',
        );

  static const String name = 'LogInRoute';
}

/// generated route for
/// [_i4.OtpPage]
class OtpRoute extends _i10.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i11.Key? key,
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

  final _i11.Key? key;

  final String verificationCode;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, verificationCode: $verificationCode}';
  }
}

/// generated route for
/// [_i5.UserInfoPage]
class UserInfoRoute extends _i10.PageRouteInfo<void> {
  const UserInfoRoute()
      : super(
          UserInfoRoute.name,
          path: '/user-info-page',
        );

  static const String name = 'UserInfoRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.ChatPage]
class ChatRoute extends _i10.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i11.Key? key,
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

  final _i11.Key? key;

  final String userName;

  final String userId;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, userName: $userName, userId: $userId}';
  }
}

/// generated route for
/// [_i8.SelectContactPage]
class SelectContactRoute extends _i10.PageRouteInfo<void> {
  const SelectContactRoute()
      : super(
          SelectContactRoute.name,
          path: '/select-contact-page',
        );

  static const String name = 'SelectContactRoute';
}

/// generated route for
/// [_i9.ConfirmedStatusPage]
class ConfirmedStatusRoute
    extends _i10.PageRouteInfo<ConfirmedStatusRouteArgs> {
  ConfirmedStatusRoute({
    _i11.Key? key,
    required _i12.File pickedFile,
  }) : super(
          ConfirmedStatusRoute.name,
          path: '/confirmed-status-page',
          args: ConfirmedStatusRouteArgs(
            key: key,
            pickedFile: pickedFile,
          ),
        );

  static const String name = 'ConfirmedStatusRoute';
}

class ConfirmedStatusRouteArgs {
  const ConfirmedStatusRouteArgs({
    this.key,
    required this.pickedFile,
  });

  final _i11.Key? key;

  final _i12.File pickedFile;

  @override
  String toString() {
    return 'ConfirmedStatusRouteArgs{key: $key, pickedFile: $pickedFile}';
  }
}
