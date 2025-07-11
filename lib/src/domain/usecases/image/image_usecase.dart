import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/domain/repositories/image/image_repository.dart';

@injectable
class ImageUsecase {
  final ImageRepository repository;

  ImageUsecase(this.repository);

  Future<String> getImageUrl(String categoryId, String wordId) async {
    return await repository.getImageUrl(categoryId: categoryId, wordId: wordId);
  }
}
