abstract class ImageRepository {
  Future<String> getImageUrl({
    required String categoryId,
    required String wordId,
  });
}
