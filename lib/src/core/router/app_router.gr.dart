// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:collection/collection.dart' as _i12;
import 'package:flutter/material.dart' as _i9;
import 'package:the_kids_app/src/domain/entities/app_update/app_update_info_entity.dart'
    as _i10;
import 'package:the_kids_app/src/domain/entities/learning_category/learning_category_entity.dart'
    as _i11;
import 'package:the_kids_app/src/presentation/features/app_update/ui/app_update_info_screen.dart'
    as _i1;
import 'package:the_kids_app/src/presentation/features/exercise/ui/exercise_screen.dart'
    as _i4;
import 'package:the_kids_app/src/presentation/features/exercise_home/ui/exercise_home_screen.dart'
    as _i3;
import 'package:the_kids_app/src/presentation/features/home/ui/category_selection_screen.dart'
    as _i2;
import 'package:the_kids_app/src/presentation/features/home/ui/subcategory_selection_screen.dart'
    as _i7;
import 'package:the_kids_app/src/presentation/features/learn_word/ui/learn_word_screen.dart'
    as _i5;
import 'package:the_kids_app/src/presentation/features/splash/ui/splash_screen.dart'
    as _i6;

/// generated route for
/// [_i1.AppUpdateScreen]
class AppUpdateRoute extends _i8.PageRouteInfo<AppUpdateRouteArgs> {
  AppUpdateRoute({
    _i9.Key? key,
    required _i10.AppUpdateInfoEntity updateInfo,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         AppUpdateRoute.name,
         args: AppUpdateRouteArgs(key: key, updateInfo: updateInfo),
         initialChildren: children,
       );

  static const String name = 'AppUpdateRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppUpdateRouteArgs>();
      return _i8.WrappedRoute(
        child: _i1.AppUpdateScreen(key: args.key, updateInfo: args.updateInfo),
      );
    },
  );
}

class AppUpdateRouteArgs {
  const AppUpdateRouteArgs({this.key, required this.updateInfo});

  final _i9.Key? key;

  final _i10.AppUpdateInfoEntity updateInfo;

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
class CategorySelectionRoute extends _i8.PageRouteInfo<void> {
  const CategorySelectionRoute({List<_i8.PageRouteInfo>? children})
    : super(CategorySelectionRoute.name, initialChildren: children);

  static const String name = 'CategorySelectionRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i2.CategorySelectionScreen());
    },
  );
}

/// generated route for
/// [_i3.ExerciseHomeScreen]
class ExerciseHomeRoute extends _i8.PageRouteInfo<ExerciseHomeRouteArgs> {
  ExerciseHomeRoute({_i9.Key? key, List<_i8.PageRouteInfo>? children})
    : super(
        ExerciseHomeRoute.name,
        args: ExerciseHomeRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ExerciseHomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExerciseHomeRouteArgs>(
        orElse: () => const ExerciseHomeRouteArgs(),
      );
      return _i3.ExerciseHomeScreen(key: args.key);
    },
  );
}

class ExerciseHomeRouteArgs {
  const ExerciseHomeRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'ExerciseHomeRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ExerciseHomeRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i4.ExerciseScreen]
class ExerciseRoute extends _i8.PageRouteInfo<void> {
  const ExerciseRoute({List<_i8.PageRouteInfo>? children})
    : super(ExerciseRoute.name, initialChildren: children);

  static const String name = 'ExerciseRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i4.ExerciseScreen());
    },
  );
}

/// generated route for
/// [_i5.LearnWordScreen]
class LearnWordRoute extends _i8.PageRouteInfo<LearnWordRouteArgs> {
  LearnWordRoute({
    _i9.Key? key,
    required String id,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         LearnWordRoute.name,
         args: LearnWordRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'LearnWordRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LearnWordRouteArgs>();
      return _i8.WrappedRoute(
        child: _i5.LearnWordScreen(key: args.key, id: args.id),
      );
    },
  );
}

class LearnWordRouteArgs {
  const LearnWordRouteArgs({this.key, required this.id});

  final _i9.Key? key;

  final String id;

  @override
  String toString() {
    return 'LearnWordRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LearnWordRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i6.SplashScreen());
    },
  );
}

/// generated route for
/// [_i7.SubcategorySelectionScreen]
class SubcategorySelectionRoute
    extends _i8.PageRouteInfo<SubcategorySelectionRouteArgs> {
  SubcategorySelectionRoute({
    _i9.Key? key,
    required String title,
    required List<_i11.LearningCategoryEntity> subcategories,
    required _i9.Color cardColor,
    List<_i8.PageRouteInfo>? children,
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

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubcategorySelectionRouteArgs>();
      return _i7.SubcategorySelectionScreen(
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

  final _i9.Key? key;

  final String title;

  final List<_i11.LearningCategoryEntity> subcategories;

  final _i9.Color cardColor;

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
        const _i12.ListEquality().equals(subcategories, other.subcategories) &&
        cardColor == other.cardColor;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      title.hashCode ^
      const _i12.ListEquality().hash(subcategories) ^
      cardColor.hashCode;
}
