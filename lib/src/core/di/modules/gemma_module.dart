import 'package:injectable/injectable.dart';

@module
abstract class GemmaModule {
  @Named('gemma_model_file_name')
  String get gemmaModelFileName => 'gemma-3n-E2B-it-int4.task';
}
