import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/repositories/app_settings/app_local_settings_repository.dart';

@injectable
class GetLastSkippedVersionUseCase {
  final AppLocalSettingsRepository _repository;

  GetLastSkippedVersionUseCase(this._repository);

  Future<String?> execute() async {
    return _repository.getLastSkippedVersion();
  }
}

@injectable
class SaveLastSkippedVersionUseCase {
  final AppLocalSettingsRepository _repository;

  SaveLastSkippedVersionUseCase(this._repository);

  Future<void> execute(String? version) async {
    return _repository.saveLastSkippedVersion(version);
  }
}
