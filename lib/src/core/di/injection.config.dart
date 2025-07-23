// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:background_downloader/background_downloader.dart' as _i677;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i627;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/datasources/llm_model/mdel_data_source.dart' as _i784;
import '../../data/datasources/llm_model/mdel_data_source_impl.dart' as _i338;
import '../../data/repository_impls/app_settings/app_local_settings_repository_impl.dart'
    as _i680;
import '../../data/repository_impls/app_update/app_update_check_repository_impl.dart'
    as _i226;
import '../../data/repository_impls/image/image_repository_impl.dart' as _i34;
import '../../data/repository_impls/learning_category/learning_category_repository_impl.dart'
    as _i942;
import '../../data/repository_impls/learning_word/word_list_repository_impl.dart'
    as _i968;
import '../../data/repository_impls/llm_model/model_repository_impl.dart'
    as _i411;
import '../../domain/repositories/app_settings/app_local_settings_repository.dart'
    as _i192;
import '../../domain/repositories/app_update/app_update_check_repository.dart'
    as _i190;
import '../../domain/repositories/image/image_repository.dart' as _i33;
import '../../domain/repositories/learning_category/learning_category_repository.dart'
    as _i582;
import '../../domain/repositories/learning_category/word_list_repository.dart'
    as _i197;
import '../../domain/repositories/llm_model/model_repository.dart' as _i96;
import '../../domain/usecases/app_settings/app_local_settings_usecase.dart'
    as _i513;
import '../../domain/usecases/app_update/check_app_update_usecase.dart'
    as _i686;
import '../../domain/usecases/image/image_usecase.dart' as _i322;
import '../../domain/usecases/learning_category/learning_category_usecase.dart'
    as _i268;
import '../../domain/usecases/learning_word/word_list_usecase.dart' as _i35;
import '../../domain/usecases/llm_model/model_usecase.dart' as _i565;
import '../../presentation/features/app_update/bloc/app_update_info_bloc.dart'
    as _i675;
import '../../presentation/features/exercise/bloc/exercise_bloc.dart' as _i770;
import '../../presentation/features/exercise_home/bloc/exercise_home_bloc.dart'
    as _i607;
import '../../presentation/features/home/bloc/categoty_selection_bloc.dart'
    as _i115;
import '../../presentation/features/learn_word/bloc/learn_word_bloc.dart'
    as _i298;
import '../../presentation/features/splash/bloc/app_update/app_update_check_bloc.dart'
    as _i401;
import '../tts/tts_service.dart' as _i369;
import 'modules/data_module.dart' as _i742;
import 'modules/file_downloader_module.dart' as _i261;
import 'modules/firebase_module.dart' as _i398;
import 'modules/gcs_module.dart' as _i1055;
import 'modules/gemma_module.dart' as _i779;
import 'modules/shared_preferences_module.dart' as _i813;
import 'modules/tts_module.dart' as _i983;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    final ttsModule = _$TtsModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dataModule = _$DataModule(this);
    final fileDownloaderModule = _$FileDownloaderModule();
    final gcsModule = _$GcsModule();
    final gemmaModule = _$GemmaModule();
    await gh.factoryAsync<_i982.FirebaseApp>(
      () => firebaseModule.firebaseApp,
      preResolve: true,
    );
    await gh.factoryAsync<_i627.FirebaseRemoteConfig>(
      () => firebaseModule.firebaseRemoteConfig,
      preResolve: true,
    );
    await gh.factoryAsync<_i369.TtsService>(
      () => ttsModule.ttsService,
      preResolve: true,
    );
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i770.ExerciseBloc>(() => _i770.ExerciseBloc());
    gh.lazySingleton<_i197.WordListRepository>(
      () => dataModule.wordListRepositoryImpl,
    );
    gh.lazySingleton<_i677.FileDownloader>(
      () => fileDownloaderModule.fileDownloader,
      instanceName: 'model_downloader',
    );
    gh.lazySingleton<_i582.LearningCategoryRepository>(
      () => dataModule.learningCategoryRepositoryImpl,
    );
    gh.lazySingleton<_i33.ImageRepository>(
      () => dataModule.imageRepositoryImpl,
    );
    gh.lazySingleton<_i190.AppUpdateCheckRepository>(
      () => dataModule.appUpdateCheckRepositoryImpl,
    );
    gh.factory<String>(
      () => gcsModule.gemmaGcsBucketName,
      instanceName: 'model_gcs_bucket',
    );
    gh.lazySingleton<_i192.AppLocalSettingsRepository>(
      () => dataModule.appLocalSettingsRepositoryImpl,
    );
    gh.factory<_i686.CheckAppUpdateUseCase>(
      () => _i686.CheckAppUpdateUseCase(gh<_i190.AppUpdateCheckRepository>()),
    );
    gh.factory<_i268.LearningCategoryUsecase>(
      () =>
          _i268.LearningCategoryUsecase(gh<_i582.LearningCategoryRepository>()),
    );
    gh.factory<String>(
      () => gemmaModule.gemma3nE4BFileName,
      instanceName: 'gemma-3n-E4B',
    );
    gh.lazySingleton<_i784.ModelDataSource>(
      () => dataModule.modelDataSourceImpl,
    );
    gh.factory<String>(
      () => gemmaModule.gemma3nE2BFileName,
      instanceName: 'gemma-3n-E2B',
    );
    gh.factory<_i115.CategorySelectionBloc>(
      () => _i115.CategorySelectionBloc(gh<_i268.LearningCategoryUsecase>()),
    );
    gh.factory<_i322.ImageUsecase>(
      () => _i322.ImageUsecase(gh<_i33.ImageRepository>()),
    );
    gh.factory<_i513.GetLastSkippedVersionUseCase>(
      () => _i513.GetLastSkippedVersionUseCase(
        gh<_i192.AppLocalSettingsRepository>(),
      ),
    );
    gh.factory<_i513.SaveLastSkippedVersionUseCase>(
      () => _i513.SaveLastSkippedVersionUseCase(
        gh<_i192.AppLocalSettingsRepository>(),
      ),
    );
    gh.factory<_i35.WordListUsecase>(
      () => _i35.WordListUsecase(gh<_i197.WordListRepository>()),
    );
    gh.factory<_i298.LearnWordBloc>(
      () => _i298.LearnWordBloc(
        gh<_i35.WordListUsecase>(),
        gh<_i322.ImageUsecase>(),
      ),
    );
    gh.lazySingleton<_i96.ModelRepository>(
      () => dataModule.modelRepositoryImpl,
    );
    gh.factory<_i675.AppUpdateInfoBloc>(
      () => _i675.AppUpdateInfoBloc(gh<_i513.SaveLastSkippedVersionUseCase>()),
    );
    gh.factory<_i565.ModelUsecase>(
      () => _i565.ModelUsecase(gh<_i96.ModelRepository>()),
    );
    gh.factory<_i401.AppUpdateCheckBloc>(
      () => _i401.AppUpdateCheckBloc(
        gh<_i686.CheckAppUpdateUseCase>(),
        gh<_i513.GetLastSkippedVersionUseCase>(),
      ),
    );
    gh.factory<_i607.ExerciseHomeBloc>(
      () => _i607.ExerciseHomeBloc(
        gh<_i565.ModelUsecase>(),
        gh<String>(instanceName: 'gemma-3n-E2B'),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i398.FirebaseModule {}

class _$TtsModule extends _i983.TtsModule {}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DataModule extends _i742.DataModule {
  _$DataModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i968.WordListRepositoryImpl get wordListRepositoryImpl =>
      _i968.WordListRepositoryImpl();

  @override
  _i942.LearningCategoryRepositoryImpl get learningCategoryRepositoryImpl =>
      _i942.LearningCategoryRepositoryImpl();

  @override
  _i34.ImageRepositoryImpl get imageRepositoryImpl =>
      _i34.ImageRepositoryImpl();

  @override
  _i226.AppUpdateCheckRepositoryImpl get appUpdateCheckRepositoryImpl =>
      _i226.AppUpdateCheckRepositoryImpl(_getIt<_i627.FirebaseRemoteConfig>());

  @override
  _i680.AppLocalSettingsRepositoryImpl get appLocalSettingsRepositoryImpl =>
      _i680.AppLocalSettingsRepositoryImpl(_getIt<_i460.SharedPreferences>());

  @override
  _i338.ModelDataSourceImpl get modelDataSourceImpl =>
      _i338.ModelDataSourceImpl(
        _getIt<_i677.FileDownloader>(instanceName: 'model_downloader'),
        _getIt<String>(instanceName: 'model_gcs_bucket'),
        _getIt<_i460.SharedPreferences>(),
      );

  @override
  _i411.ModelRepositoryImpl get modelRepositoryImpl =>
      _i411.ModelRepositoryImpl(_getIt<_i784.ModelDataSource>());
}

class _$FileDownloaderModule extends _i261.FileDownloaderModule {}

class _$GcsModule extends _i1055.GcsModule {}

class _$GemmaModule extends _i779.GemmaModule {}
