// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:collection/collection.dart' as _i9;
import 'package:flutter/material.dart' as _i6;
import 'package:the_kids_app/src/domain/entities/app_update/app_update_info_entity.dart'
    as _i7;
import 'package:the_kids_app/src/domain/entities/learning_category/learning_category_entity.dart'
    as _i8;
import 'package:the_kids_app/src/presentation/features/app_update/ui/app_update_info_screen.dart'
    as _i1;
import 'package:the_kids_app/src/presentation/features/home/ui/category_selection_screen.dart'
    as _i2;
import 'package:the_kids_app/src/presentation/features/home/ui/subcategory_selection_screen.dart'
    as _i4;
import 'package:the_kids_app/src/presentation/features/splash/ui/splash_screen.dart'
    as _i3;

/// generated route for
/// [_i1.AppUpdateScreen]
class AppUpdateRoute extends _i5.PageRouteInfo<AppUpdateRouteArgs> {
  AppUpdateRoute({
    _i6.Key? key,
    required _i7.AppUpdateInfoEntity updateInfo,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         AppUpdateRoute.name,
         args: AppUpdateRouteArgs(key: key, updateInfo: updateInfo),
         initialChildren: children,
       );

  static const String name = 'AppUpdateRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppUpdateRouteArgs>();
      return _i5.WrappedRoute(
        child: _i1.AppUpdateScreen(key: args.key, updateInfo: args.updateInfo),
      );
    },
  );
}

class AppUpdateRouteArgs {
  const AppUpdateRouteArgs({this.key, required this.updateInfo});

  final _i6.Key? key;

  final _i7.AppUpdateInfoEntity updateInfo;

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
/// [_i2.CategorySelectionScreen]
class CategorySelectionRoute
    extends _i5.PageRouteInfo<CategorySelectionRouteArgs> {
  CategorySelectionRoute({_i6.Key? key, List<_i5.PageRouteInfo>? children})
    : super(
        CategorySelectionRoute.name,
        args: CategorySelectionRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'CategorySelectionRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategorySelectionRouteArgs>(
        orElse: () => const CategorySelectionRouteArgs(),
      );
      return _i5.WrappedRoute(
        child: _i2.CategorySelectionScreen(key: args.key),
      );
    },
  );
}

class CategorySelectionRouteArgs {
  const CategorySelectionRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'CategorySelectionRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CategorySelectionRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.WrappedRoute(child: const _i3.SplashScreen());
    },
  );
}

/// generated route for
/// [_i4.SubcategorySelectionScreen]
class SubcategorySelectionRoute
    extends _i5.PageRouteInfo<SubcategorySelectionRouteArgs> {
  SubcategorySelectionRoute({
    _i6.Key? key,
    required String title,
    required List<_i8.LearningCategoryEntity> subcategories,
    required _i6.Color cardColor,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         SubcategorySelectionRoute.name,
         args: SubcategorySelectionRouteArgs(
           key: key,
           title: title,
           subcategories: subcategories,
           cardColor: cardColor,
         ),
         initialChildren: children,
       );

  static const String name = 'SubcategorySelectionRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubcategorySelectionRouteArgs>();
      return _i4.SubcategorySelectionScreen(
        key: args.key,
        title: args.title,
        subcategories: args.subcategories,
        cardColor: args.cardColor,
      );
    },
  );
}

class SubcategorySelectionRouteArgs {
  const SubcategorySelectionRouteArgs({
    this.key,
    required this.title,
    required this.subcategories,
    required this.cardColor,
  });

  final _i6.Key? key;

  final String title;

  final List<_i8.LearningCategoryEntity> subcategories;

  final _i6.Color cardColor;

  @override
  String toString() {
    return 'SubcategorySelectionRouteArgs{key: $key, title: $title, subcategories: $subcategories, cardColor: $cardColor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SubcategorySelectionRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        const _i9.ListEquality().equals(subcategories, other.subcategories) &&
        cardColor == other.cardColor;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      title.hashCode ^
      const _i9.ListEquality().hash(subcategories) ^
      cardColor.hashCode;
}
