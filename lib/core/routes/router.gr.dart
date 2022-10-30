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
import 'dart:io' as _i15;

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../../auth/presentation/login_page.dart' as _i3;
import '../../auth/presentation/otp_page.dart' as _i4;
import '../../auth/presentation/user_info_page.dart' as _i5;
import '../../call/domain/callModel/call_model.dart' as _i17;
import '../../call/presentation/call_page.dart' as _i12;
import '../../chat/presentation/chat_page.dart' as _i7;
import '../../getContacts/presentation/select_contact_page.dart' as _i8;
import '../../group/presentation/create_group_page.dart' as _i11;
import '../../home/home_page.dart' as _i6;
import '../../landing/landing_page.dart' as _i2;
import '../../splash_page.dart' as _i1;
import '../../status/domain/statusModel/status_model.dart' as _i16;
import '../../status/presentation/confirmed_status_page.dart' as _i9;
import '../../status/presentation/status_viewed_page.dart' as _i10;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LandingRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.LandingPage(),
        transitionsBuilder: _i13.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LogInRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.LogInPage(),
        transitionsBuilder: _i13.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.OtpPage(
          key: args.key,
          verificationCode: args.verificationCode,
        ),
        transitionsBuilder: _i13.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserInfoRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.UserInfoPage(),
        transitionsBuilder: _i13.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
        transitionsBuilder: _i13.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.ChatPage(
          key: args.key,
          name: args.name,
          id: args.id,
          isGroupChat: args.isGroupChat,
          profilePic: args.profilePic,
        ),
        transitionsBuilder: _i13.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SelectContactRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.SelectContactPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ConfirmedStatusRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmedStatusRouteArgs>();
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: _i9.ConfirmedStatusPage(
          key: args.key,
          pickedFile: args.pickedFile,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    StatusViewedRoute.name: (routeData) {
      final args = routeData.argsAs<StatusViewedRouteArgs>();
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: _i10.StatusViewedPage(
          key: args.key,
          status: args.status,
        ),
        transitionsBuilder: _i13.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateGroupRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.CreateGroupPage(),
        transitionsBuilder: _i13.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CallRoute.name: (routeData) {
      final args = routeData.argsAs<CallRouteArgs>();
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: _i12.CallPage(
          key: args.key,
          channelId: args.channelId,
          callModel: args.callModel,
          isGroupChat: args.isGroupChat,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i13.RouteConfig(
          LandingRoute.name,
          path: '/landing-page',
        ),
        _i13.RouteConfig(
          LogInRoute.name,
          path: '/log-in-page',
        ),
        _i13.RouteConfig(
          OtpRoute.name,
          path: '/otp-page',
        ),
        _i13.RouteConfig(
          UserInfoRoute.name,
          path: '/user-info-page',
        ),
        _i13.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i13.RouteConfig(
          ChatRoute.name,
          path: '/chat-page',
        ),
        _i13.RouteConfig(
          SelectContactRoute.name,
          path: '/select-contact-page',
        ),
        _i13.RouteConfig(
          ConfirmedStatusRoute.name,
          path: '/confirmed-status-page',
        ),
        _i13.RouteConfig(
          StatusViewedRoute.name,
          path: '/status-viewed-page',
        ),
        _i13.RouteConfig(
          CreateGroupRoute.name,
          path: '/create-group-page',
        ),
        _i13.RouteConfig(
          CallRoute.name,
          path: '/call-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LandingPage]
class LandingRoute extends _i13.PageRouteInfo<void> {
  const LandingRoute()
      : super(
          LandingRoute.name,
          path: '/landing-page',
        );

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i3.LogInPage]
class LogInRoute extends _i13.PageRouteInfo<void> {
  const LogInRoute()
      : super(
          LogInRoute.name,
          path: '/log-in-page',
        );

  static const String name = 'LogInRoute';
}

/// generated route for
/// [_i4.OtpPage]
class OtpRoute extends _i13.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i14.Key? key,
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

  final _i14.Key? key;

  final String verificationCode;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, verificationCode: $verificationCode}';
  }
}

/// generated route for
/// [_i5.UserInfoPage]
class UserInfoRoute extends _i13.PageRouteInfo<void> {
  const UserInfoRoute()
      : super(
          UserInfoRoute.name,
          path: '/user-info-page',
        );

  static const String name = 'UserInfoRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.ChatPage]
class ChatRoute extends _i13.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i14.Key? key,
    required String name,
    required String id,
    required bool isGroupChat,
    required String profilePic,
  }) : super(
          ChatRoute.name,
          path: '/chat-page',
          args: ChatRouteArgs(
            key: key,
            name: name,
            id: id,
            isGroupChat: isGroupChat,
            profilePic: profilePic,
          ),
        );

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.name,
    required this.id,
    required this.isGroupChat,
    required this.profilePic,
  });

  final _i14.Key? key;

  final String name;

  final String id;

  final bool isGroupChat;

  final String profilePic;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, name: $name, id: $id, isGroupChat: $isGroupChat, profilePic: $profilePic}';
  }
}

/// generated route for
/// [_i8.SelectContactPage]
class SelectContactRoute extends _i13.PageRouteInfo<void> {
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
    extends _i13.PageRouteInfo<ConfirmedStatusRouteArgs> {
  ConfirmedStatusRoute({
    _i14.Key? key,
    required _i15.File pickedFile,
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

  final _i14.Key? key;

  final _i15.File pickedFile;

  @override
  String toString() {
    return 'ConfirmedStatusRouteArgs{key: $key, pickedFile: $pickedFile}';
  }
}

/// generated route for
/// [_i10.StatusViewedPage]
class StatusViewedRoute extends _i13.PageRouteInfo<StatusViewedRouteArgs> {
  StatusViewedRoute({
    _i14.Key? key,
    required _i16.StatusModel status,
  }) : super(
          StatusViewedRoute.name,
          path: '/status-viewed-page',
          args: StatusViewedRouteArgs(
            key: key,
            status: status,
          ),
        );

  static const String name = 'StatusViewedRoute';
}

class StatusViewedRouteArgs {
  const StatusViewedRouteArgs({
    this.key,
    required this.status,
  });

  final _i14.Key? key;

  final _i16.StatusModel status;

  @override
  String toString() {
    return 'StatusViewedRouteArgs{key: $key, status: $status}';
  }
}

/// generated route for
/// [_i11.CreateGroupPage]
class CreateGroupRoute extends _i13.PageRouteInfo<void> {
  const CreateGroupRoute()
      : super(
          CreateGroupRoute.name,
          path: '/create-group-page',
        );

  static const String name = 'CreateGroupRoute';
}

/// generated route for
/// [_i12.CallPage]
class CallRoute extends _i13.PageRouteInfo<CallRouteArgs> {
  CallRoute({
    _i14.Key? key,
    required String channelId,
    required _i17.CallModel callModel,
    required bool isGroupChat,
  }) : super(
          CallRoute.name,
          path: '/call-page',
          args: CallRouteArgs(
            key: key,
            channelId: channelId,
            callModel: callModel,
            isGroupChat: isGroupChat,
          ),
        );

  static const String name = 'CallRoute';
}

class CallRouteArgs {
  const CallRouteArgs({
    this.key,
    required this.channelId,
    required this.callModel,
    required this.isGroupChat,
  });

  final _i14.Key? key;

  final String channelId;

  final _i17.CallModel callModel;

  final bool isGroupChat;

  @override
  String toString() {
    return 'CallRouteArgs{key: $key, channelId: $channelId, callModel: $callModel, isGroupChat: $isGroupChat}';
  }
}
