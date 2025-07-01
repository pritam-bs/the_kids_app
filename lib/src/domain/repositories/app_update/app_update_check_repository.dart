import 'package:the_kids_app/src/domain/entities/app_update/app_update_info_entity.dart';

abstract class AppUpdateCheckRepository {
  Future<AppUpdateInfoEntity> getAppUpdateInfo();
}
