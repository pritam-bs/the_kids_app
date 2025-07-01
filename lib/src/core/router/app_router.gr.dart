// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:the_kids_app/src/domain/entities/app_update/app_update_info_entity.dart'
    as _i6;
import 'package:the_kids_app/src/presentation/features/app_update/ui/app_update_info_screen.dart'
    as _i1;
import 'package:the_kids_app/src/presentation/features/home/ui/home_screen.dart'
    as _i2;
import 'package:the_kids_app/src/presentation/features/splash/ui/splash_screen.dart'
    as _i3;

/// generated route for
/// [_i1.AppUpdateScreen]
class AppUpdateRoute extends _i4.PageRouteInfo<AppUpdateRouteArgs> {
  AppUpdateRoute({
    _i5.Key? key,
    required _i6.AppUpdateInfoEntity updateInfo,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         AppUpdateRoute.name,
         args: AppUpdateRouteArgs(key: key, updateInfo: updateInfo),
         initialChildren: children,
       );

  static const String name = 'AppUpdateRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppUpdateRouteArgs>();
      return _i4.WrappedRoute(
        child: _i1.AppUpdateScreen(key: args.key, updateInfo: args.updateInfo),
      );
    },
  );
}

class AppUpdateRouteArgs {
  const AppUpdateRouteArgs({this.key, required this.updateInfo});

  final _i5.Key? key;

  final _i6.AppUpdateInfoEntity updateInfo;

  @override
  String toString() {
    return 'AppUpdateRouteArgs{key: $key, updateInfo: $updateInfo}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AppUpdateRouteArgs) return false;
    return key == other.key && updateInfo == other.updateInfo;
  }

  @override
  int get hashCode => key.hashCode ^ updateInfo.hashCode;
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i4.WrappedRoute(child: const _i2.HomeScreen());
    },
  );
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i4.WrappedRoute(child: const _i3.SplashScreen());
    },
  );
}
