import 'package:injectable/injectable.dart';

@module
abstract class GcsModule {
  @Named('model_gcs_bucket')
  String get gemmaGcsBucketName => 'model-gcs-bucket';
}
