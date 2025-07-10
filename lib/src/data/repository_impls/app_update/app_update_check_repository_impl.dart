import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/data/dtos/app_update/app_update_info_dto.dart';
import 'package:the_kids_app/src/data/mappers/app_update/app_update_info_mapper.dart';
import 'package:the_kids_app/src/domain/entities/app_update/app_update_info_entity.dart';
import 'package:the_kids_app/src/domain/repositories/app_update/app_update_check_repository.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class AppUpdateCheckRepositoryImpl implements AppUpdateCheckRepository {
  final FirebaseRemoteConfig _remoteConfig;

  AppUpdateCheckRepositoryImpl(this._remoteConfig);

  @override
  Future<AppUpdateInfoEntity> getAppUpdateInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    final updateInfoDto = await _getRemoteUpdateInfo();

    return updateInfoDto.toEntity(currentVersion);
  }

  Future<AppUpdateInfoDTO> _getRemoteUpdateInfo() async {
    try {
      final bool updated = await _remoteConfig.fetchAndActivate();

      if (updated) {
        AppLogger.d('Remote Config updated and activated.');
      } else {
        AppLogger.d('Remote Config is already up to date.');
      }

      
      final appUpdateInfoKey = switch (defaultTargetPlatform) {
        TargetPlatform.android => "app_update_info_android",
        TargetPlatform.iOS => "app_update_info_ios",
        _ => throw UnimplementedError(),
      };

      // Get the JSON string for app update information
      final String updateInfoJsonString = _remoteConfig.getString(
        appUpdateInfoKey,
      );

      if (updateInfoJsonString.isEmpty) {
        AppLogger.e("Remote Config '$appUpdateInfoKey' key is empty.");
        throw Exception("App update configuration not found or is empty.");
      }

      final Map<String, dynamic> jsonMap = jsonDecode(updateInfoJsonString);

      return AppUpdateInfoDTO.fromJson(jsonMap);
    } on FirebaseException catch (e) {
      AppLogger.e(
        "Firebase Remote Config fetch error: ${e.code} - ${e.message}",
      );
      rethrow;
    } catch (e) {
      AppLogger.e("Error parsing Remote Config for App Update Info: $e");
      rethrow;
    }
  }
}
