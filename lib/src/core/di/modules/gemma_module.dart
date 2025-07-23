import 'package:injectable/injectable.dart';

@module
abstract class GemmaModule {
  @Named('gemma-3n-E2B')
  String get gemma3nE2BFileName => 'gemma-3n-E2B-it-int4.task';

  @Named('gemma-3n-E4B')
  String get gemma3nE4BFileName => 'gemma-3n-E4B-it-int4.task';
}
