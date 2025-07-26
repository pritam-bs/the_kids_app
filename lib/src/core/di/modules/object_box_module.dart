import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:the_kids_app/objectbox.g.dart';
import 'package:the_kids_app/src/data/dtos/learned_word/learned_word_dto.dart';

@module
abstract class InjectionModule {
  @preResolve
  Future<Store> get store async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(
      directory: path.join(docsDir.path, "the_kids_app_box_db"),
    );
    return store;
  }

  @lazySingleton
  Box<LearnedWordDto> getLearnedWordBox(Store store) =>
      store.box<LearnedWordDto>();
}
