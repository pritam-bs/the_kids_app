// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:collection/collection.dart' as _i14;
import 'package:flutter/material.dart' as _i10;
import 'package:the_kids_app/src/domain/entities/app_update/app_update_info_entity.dart'
    as _i11;
import 'package:the_kids_app/src/domain/entities/exercise/exercise_type.dart'
    as _i12;
import 'package:the_kids_app/src/domain/entities/learning_category/learning_category_entity.dart'
    as _i13;
import 'package:the_kids_app/src/presentation/features/app_update/ui/app_update_info_screen.dart'
    as _i1;
import 'package:the_kids_app/src/presentation/features/exercise/ui/exercise_screen.dart'
    as _i4;
import 'package:the_kids_app/src/presentation/features/exercise_home/ui/exercise_home_screen.dart'
    as _i3;
import 'package:the_kids_app/src/presentation/features/home/ui/category_selection_screen.dart'
    as _i2;
import 'package:the_kids_app/src/presentation/features/home/ui/subcategory_selection_screen.dart'
    as _i8;
import 'package:the_kids_app/src/presentation/features/learn_word/ui/learn_word_screen.dart'
    as _i5;
import 'package:the_kids_app/src/presentation/features/splash/ui/splash_screen.dart'
    as _i6;
import 'package:the_kids_app/src/presentation/features/story/ui/story_screen.dart'
    as _i7;

/// generated route for
/// [_i1.AppUpdateScreen]
class AppUpdateRoute extends _i9.PageRouteInfo<AppUpdateRouteArgs> {
  AppUpdateRoute({
    _i10.Key? key,
    required _i11.AppUpdateInfoEntity updateInfo,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         AppUpdateRoute.name,
         args: AppUpdateRouteArgs(key: key, updateInfo: updateInfo),
         initialChildren: children,
       );

  static const String name = 'AppUpdateRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppUpdateRouteArgs>();
      return _i9.WrappedRoute(
        child: _i1.AppUpdateScreen(key: args.key, updateInfo: args.updateInfo),
      );
    },
  );
}

class AppUpdateRouteArgs {
  const AppUpdateRouteArgs({this.key, required this.updateInfo});

  final _i10.Key? key;

  final _i11.AppUpdateInfoEntity updateInfo;

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
class CategorySelectionRoute extends _i9.PageRouteInfo<void> {
  const CategorySelectionRoute({List<_i9.PageRouteInfo>? children})
    : super(CategorySelectionRoute.name, initialChildren: children);

  static const String name = 'CategorySelectionRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i2.CategorySelectionScreen());
    },
  );
}

/// generated route for
/// [_i3.ExerciseHomeScreen]
class ExerciseHomeRoute extends _i9.PageRouteInfo<void> {
  const ExerciseHomeRoute({List<_i9.PageRouteInfo>? children})
    : super(ExerciseHomeRoute.name, initialChildren: children);

  static const String name = 'ExerciseHomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i3.ExerciseHomeScreen());
    },
  );
}

/// generated route for
/// [_i4.ExerciseScreen]
class ExerciseRoute extends _i9.PageRouteInfo<ExerciseRouteArgs> {
  ExerciseRoute({
    _i10.Key? key,
    required _i12.ExerciseType type,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         ExerciseRoute.name,
         args: ExerciseRouteArgs(key: key, type: type),
         initialChildren: children,
       );

  static const String name = 'ExerciseRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExerciseRouteArgs>();
      return _i9.WrappedRoute(
        child: _i4.ExerciseScreen(key: args.key, type: args.type),
      );
    },
  );
}

class ExerciseRouteArgs {
  const ExerciseRouteArgs({this.key, required this.type});

  final _i10.Key? key;

  final _i12.ExerciseType type;

  @override
  String toString() {
    return 'ExerciseRouteArgs{key: $key, type: $type}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ExerciseRouteArgs) return false;
    return key == other.key && type == other.type;
  }

  @override
  int get hashCode => key.hashCode ^ type.hashCode;
}

/// generated route for
/// [_i5.LearnWordScreen]
class LearnWordRoute extends _i9.PageRouteInfo<LearnWordRouteArgs> {
  LearnWordRoute({
    _i10.Key? key,
    required String id,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         LearnWordRoute.name,
         args: LearnWordRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'LearnWordRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LearnWordRouteArgs>();
      return _i9.WrappedRoute(
        child: _i5.LearnWordScreen(key: args.key, id: args.id),
      );
    },
  );
}

class LearnWordRouteArgs {
  const LearnWordRouteArgs({this.key, required this.id});

  final _i10.Key? key;

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
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i6.SplashScreen());
    },
  );
}

/// generated route for
/// [_i7.StoryScreen]
class StoryRoute extends _i9.PageRouteInfo<void> {
  const StoryRoute({List<_i9.PageRouteInfo>? children})
    : super(StoryRoute.name, initialChildren: children);

  static const String name = 'StoryRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.StoryScreen();
    },
  );
}

/// generated route for
/// [_i8.SubcategorySelectionScreen]
class SubcategorySelectionRoute
    extends _i9.PageRouteInfo<SubcategorySelectionRouteArgs> {
  SubcategorySelectionRoute({
    _i10.Key? key,
    required String title,
    required List<_i13.LearningCategoryEntity> subcategories,
    required _i10.Color cardColor,
    List<_i9.PageRouteInfo>? children,
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

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubcategorySelectionRouteArgs>();
      return _i8.SubcategorySelectionScreen(
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

  final _i10.Key? key;

  final String title;

  final List<_i13.LearningCategoryEntity> subcategories;

  final _i10.Color cardColor;

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
        const _i14.ListEquality().equals(subcategories, other.subcategories) &&
        cardColor == other.cardColor;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      title.hashCode ^
      const _i14.ListEquality().hash(subcategories) ^
      cardColor.hashCode;
}
