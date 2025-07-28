import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/data/datasources/exercise_store/exercise_store_datasource.dart';
import 'package:the_kids_app/src/data/datasources/exercise_store/exercise_store_datasource_impl.dart';
import 'package:the_kids_app/src/data/datasources/learned_word/learned_word_data_source.dart';
import 'package:the_kids_app/src/data/datasources/learned_word/learned_word_data_source_impl.dart';
import 'package:the_kids_app/src/data/datasources/llm_inference/gemma_inference_data_source.dart';
import 'package:the_kids_app/src/data/datasources/llm_inference/inference_data_source.dart';
import 'package:the_kids_app/src/data/datasources/llm_model/mdel_data_source.dart';
import 'package:the_kids_app/src/data/datasources/llm_model/mdel_data_source_impl.dart';
import 'package:the_kids_app/src/data/datasources/story/story_data_source.dart';
import 'package:the_kids_app/src/data/datasources/story/story_data_source_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/app_settings/app_local_settings_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/app_update/app_update_check_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/exercise/exercise_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/exercise_store/exercise_store_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/image/image_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/learned_word/learned_word_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/learning_category/learning_category_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/learning_word/word_list_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/llm_model/model_repository_impl.dart';
import 'package:the_kids_app/src/data/repository_impls/story/story_repository_impl.dart';
import 'package:the_kids_app/src/domain/repositories/app_settings/app_local_settings_repository.dart';
import 'package:the_kids_app/src/domain/repositories/app_update/app_update_check_repository.dart';
import 'package:the_kids_app/src/domain/repositories/exercise/exercise_repository.dart';
import 'package:the_kids_app/src/domain/repositories/exercise_store/exercise_store_repository.dart';
import 'package:the_kids_app/src/domain/repositories/image/image_repository.dart';
import 'package:the_kids_app/src/domain/repositories/learned_word/learned_word_repository.dart';
import 'package:the_kids_app/src/domain/repositories/learning_category/learning_category_repository.dart';
import 'package:the_kids_app/src/domain/repositories/learning_category/word_list_repository.dart';
import 'package:the_kids_app/src/domain/repositories/llm_model/model_repository.dart';
import 'package:the_kids_app/src/domain/repositories/story/story_repository.dart';

@module
abstract class DataModule {
  // Datasources
  @LazySingleton(as: ModelDataSource)
  ModelDataSourceImpl get modelDataSourceImpl;

  @LazySingleton(as: InferenceDataSource)
  GemmaInferenceDataSource get gemmaInferenceDataSource;

  @LazySingleton(as: ExerciseStoreDatasource)
  ExerciseStoreDatasourceImpl get exerciseStoreDatasource;

  @LazySingleton(as: LearnedWordDataSource)
  LearnedWordDataSourceImpl get learnedWordDataSource;

  @LazySingleton(as: StoryDataSource)
  StoryDataSourceImpl get storyDataSource;

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

  @LazySingleton(as: ExerciseStoreRepository)
  ExerciseStoreRepositoryImpl get exerciseStoreRepository;

  @LazySingleton(as: StoryRepository)
  StoryRepositoryImpl get storyRepository;
}
