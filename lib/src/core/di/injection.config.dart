// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i627;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/repository_impls/app_settings/app_local_settings_repository_impl.dart'
    as _i680;
import '../../data/repository_impls/app_update/app_update_check_repository_impl.dart'
    as _i226;
import '../../domain/repositories/app_settings/app_local_settings_repository.dart'
    as _i192;
import '../../domain/repositories/app_update/app_update_check_repository.dart'
    as _i190;
import '../../domain/usecases/app_settings/app_local_settings_usecase.dart'
    as _i513;
import '../../domain/usecases/app_update/check_app_update_usecase.dart'
    as _i686;
import '../../presentation/features/app_update/bloc/app_update_info_bloc.dart'
    as _i675;
import '../../presentation/features/home/bloc/home_bloc.dart' as _i635;
import '../../presentation/features/splash/bloc/app_update/app_update_check_bloc.dart'
    as _i401;
import 'modules/data_module.dart' as _i742;
import 'modules/firebase_module.dart' as _i398;
import 'modules/shared_preferences_module.dart' as _i813;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dataModule = _$DataModule(this);
    await gh.factoryAsync<_i982.FirebaseApp>(
      () => firebaseModule.firebaseApp,
      preResolve: true,
    );
    await gh.factoryAsync<_i627.FirebaseRemoteConfig>(
      () => firebaseModule.firebaseRemoteConfig,
      preResolve: true,
    );
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i635.HomeBloc>(() => _i635.HomeBloc());
    gh.lazySingleton<_i190.AppUpdateCheckRepository>(
      () => dataModule.appUpdateCheckRepositoryImpl,
    );
    gh.lazySingleton<_i192.AppLocalSettingsRepository>(
      () => dataModule.appLocalSettingsRepositoryImpl,
    );
    gh.factory<_i686.CheckAppUpdateUseCase>(
      () => _i686.CheckAppUpdateUseCase(gh<_i190.AppUpdateCheckRepository>()),
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
    gh.factory<_i675.AppUpdateInfoBloc>(
      () => _i675.AppUpdateInfoBloc(gh<_i513.SaveLastSkippedVersionUseCase>()),
    );
    gh.factory<_i401.AppUpdateCheckBloc>(
      () => _i401.AppUpdateCheckBloc(
        gh<_i686.CheckAppUpdateUseCase>(),
        gh<_i513.GetLastSkippedVersionUseCase>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i398.FirebaseModule {}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DataModule extends _i742.DataModule {
  _$DataModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i226.AppUpdateCheckRepositoryImpl get appUpdateCheckRepositoryImpl =>
      _i226.AppUpdateCheckRepositoryImpl(_getIt<_i627.FirebaseRemoteConfig>());

  @override
  _i680.AppLocalSettingsRepositoryImpl get appLocalSettingsRepositoryImpl =>
      _i680.AppLocalSettingsRepositoryImpl(_getIt<_i460.SharedPreferences>());
}
