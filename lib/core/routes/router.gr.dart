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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../auth/presentation/login_page.dart' as _i3;
import '../../auth/presentation/otp_page.dart' as _i4;
import '../../auth/presentation/user_info_page.dart' as _i5;
import '../../home/presentation/home_page.dart' as _i6;
import '../../landing/landing_page.dart' as _i2;
import '../../splash_page.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LandingRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.LandingPage(),
        transitionsBuilder: _i7.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LogInRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.LogInPage(),
        transitionsBuilder: _i7.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.OtpPage(
          key: args.key,
          verificationCode: args.verificationCode,
        ),
        transitionsBuilder: _i7.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserInfoRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.UserInfoPage(),
        transitionsBuilder: _i7.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
        transitionsBuilder: _i7.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          LandingRoute.name,
          path: '/landing-page',
        ),
        _i7.RouteConfig(
          LogInRoute.name,
          path: '/log-in-page',
        ),
        _i7.RouteConfig(
          OtpRoute.name,
          path: '/otp-page',
        ),
        _i7.RouteConfig(
          UserInfoRoute.name,
          path: '/user-info-page',
        ),
        _i7.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LandingPage]
class LandingRoute extends _i7.PageRouteInfo<void> {
  const LandingRoute()
      : super(
          LandingRoute.name,
          path: '/landing-page',
        );

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i3.LogInPage]
class LogInRoute extends _i7.PageRouteInfo<void> {
  const LogInRoute()
      : super(
          LogInRoute.name,
          path: '/log-in-page',
        );

  static const String name = 'LogInRoute';
}

/// generated route for
/// [_i4.OtpPage]
class OtpRoute extends _i7.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i8.Key? key,
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

  final _i8.Key? key;

  final String verificationCode;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, verificationCode: $verificationCode}';
  }
}

/// generated route for
/// [_i5.UserInfoPage]
class UserInfoRoute extends _i7.PageRouteInfo<void> {
  const UserInfoRoute()
      : super(
          UserInfoRoute.name,
          path: '/user-info-page',
        );

  static const String name = 'UserInfoRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}
