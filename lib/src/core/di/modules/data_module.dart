import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/data/repository_impls/app_settings/app_local_settings_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/app_update/app_update_check_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/learning_category/learning_category_repository_impl.dart';
import 'package:the_kids_app/src/domain/repositories/app_settings/app_local_settings_repository.dart';
import 'package:the_kids_app/src/domain/repositories/app_update/app_update_check_repository.dart';
import 'package:the_kids_app/src/domain/repositories/learning_category/learning_category_repository.dart';

@module
abstract class DataModule {
  @LazySingleton(as: AppLocalSettingsRepository)
  AppLocalSettingsRepositoryImpl get appLocalSettingsRepositoryImpl;

  @LazySingleton(as: AppUpdateCheckRepository)
  AppUpdateCheckRepositoryImpl get appUpdateCheckRepositoryImpl;

  @LazySingleton(as: LearningCategoryRepository)
  LearningCategoryRepositoryImpl get learningCategoryRepository;
}
