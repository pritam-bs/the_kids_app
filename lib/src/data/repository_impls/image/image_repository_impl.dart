import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/domain/repositories/image/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final String _r2AccessKeyId = const String.fromEnvironment(
    'R2_ACCESS_KEY_ID',
  );
  final String _r2SecretAccessKey = const String.fromEnvironment(
    'R2_SECRET_ACCESS_KEY',
  );
  final String _cloudflareAccountId = const String.fromEnvironment(
    'CLOUDFLARE_ACCOUNT_ID',
  );

  ImageRepositoryImpl() {
    CloudFlareR2.init(
      accountId: _cloudflareAccountId,
      accessKeyId: _r2AccessKeyId,
      secretAccessKey: _r2SecretAccessKey,
    );

    AppLogger.i('CloudFlareR2 initialized');
  }

  @override
  Future<String> getImageUrl({
    required String categoryId,
    required String wordId,
  }) async {
    final bucket = categoryId.replaceAll(RegExp(r'_'), '-');
    try {
      final String imageUrl = await CloudFlareR2.getPresignedUrl(
        bucket: bucket,
        objectName: '$wordId.jpg',
      );
      return imageUrl;
    } catch (e) {
      AppLogger.e('Unexpected error fetching image from R2: $e');
      rethrow;
    }
  }
}
