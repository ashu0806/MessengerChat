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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../auth/presentation/login_page.dart' as _i3;
import '../../landing/landing_page.dart' as _i2;
import '../../splash_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LandingRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.LandingPage(),
        transitionsBuilder: _i4.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LogInRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.LogInPage(),
        transitionsBuilder: _i4.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          LandingRoute.name,
          path: '/landing-page',
        ),
        _i4.RouteConfig(
          LogInRoute.name,
          path: '/log-in-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LandingPage]
class LandingRoute extends _i4.PageRouteInfo<void> {
  const LandingRoute()
      : super(
          LandingRoute.name,
          path: '/landing-page',
        );

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i3.LogInPage]
class LogInRoute extends _i4.PageRouteInfo<void> {
  const LogInRoute()
      : super(
          LogInRoute.name,
          path: '/log-in-page',
        );

  static const String name = 'LogInRoute';
}
