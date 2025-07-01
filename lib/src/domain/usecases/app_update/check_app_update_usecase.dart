import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/entities/app_update/app_update_info_entity.dart';
import 'package:the_kids_app/src/domain/repositories/app_update/app_update_check_repository.dart';

@injectable
class CheckAppUpdateUseCase {
  final AppUpdateCheckRepository repository;

  CheckAppUpdateUseCase(this.repository);

  Future<AppUpdateInfoEntity> execute() async {
    return await repository.getAppUpdateInfo();
  }
}
