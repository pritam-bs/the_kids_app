import 'package:background_downloader/background_downloader.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';

@module
abstract class FileDownloaderModule {
  @lazySingleton
  @Named('model_downloader')
  FileDownloader get fileDownloader {
    final FileDownloader downloader = FileDownloader();

    downloader.start();

    AppLogger.i('⚡️ FileDownloader configured');
    return downloader;
  }
}
