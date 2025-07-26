import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/data/datasources/learned_word/learned_word_data_source.dart';
import 'package:the_kids_app/src/data/datasources/learned_word/learned_word_data_source_impl.dart';
import 'package:the_kids_app/src/data/datasources/llm_inference/gemma_inference_data_source.dart';
import 'package:the_kids_app/src/data/datasources/llm_inference/inference_data_source.dart';
import 'package:the_kids_app/src/data/datasources/llm_model/mdel_data_source.dart';
import 'package:the_kids_app/src/data/datasources/llm_model/mdel_data_source_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/app_settings/app_local_settings_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/app_update/app_update_check_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/exercise/exercise_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/image/image_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/learned_word/learned_word_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/learning_category/learning_category_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/learning_word/word_list_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/llm_model/model_repository_impl.dart';
import 'package:the_kids_app/src/domain/repositories/app_settings/app_local_settings_repository.dart';
import 'package:the_kids_app/src/domain/repositories/app_update/app_update_check_repository.dart';
import 'package:the_kids_app/src/domain/repositories/exercise/exercise_repository.dart';
import 'package:the_kids_app/src/domain/repositories/image/image_repository.dart';
import 'package:the_kids_app/src/domain/repositories/learned_word/learned_word_repository.dart';
import 'package:the_kids_app/src/domain/repositories/learning_category/learning_category_repository.dart';
import 'package:the_kids_app/src/domain/repositories/learning_category/word_list_repository.dart';
import 'package:the_kids_app/src/domain/repositories/llm_model/model_repository.dart';

@module
abstract class DataModule {
  // Datasources
  @LazySingleton(as: ModelDataSource)
  ModelDataSourceImpl get modelDataSourceImpl;

  @LazySingleton(as: InferenceDataSource)
  GemmaInferenceDataSource get gemmaInferenceDataSource;

  @LazySingleton(as: LearnedWordDataSource)
  LearnedWordDataSourceImpl get learnedWordDataSource;

  // Repositories
  @LazySingleton(as: AppLocalSettingsRepository)
  AppLocalSettingsRepositoryImpl get appLocalSettingsRepositoryImpl;

  @LazySingleton(as: AppUpdateCheckRepository)
  AppUpdateCheckRepositoryImpl get appUpdateCheckRepositoryImpl;

  @LazySingleton(as: LearningCategoryRepository)
  LearningCategoryRepositoryImpl get learningCategoryRepositoryImpl;

  @LazySingleton(as: WordListRepository)
  WordListRepositoryImpl get wordListRepositoryImpl;

  @LazySingleton(as: ImageRepository)
  ImageRepositoryImpl get imageRepositoryImpl;

  @LazySingleton(as: ModelRepository)
  ModelRepositoryImpl get modelRepositoryImpl;

  @LazySingleton(as: ExerciseRepository)
  ExerciseRepositoryImpl get exerciseRepositoryImpl;

  @LazySingleton(as: LearnedWordRepository)
  LearnedWordRepositoryImpl get learnedWordRepository;
}
