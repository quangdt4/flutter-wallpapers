import '../response/collection_item_res.dart';
import '../response/photo_res.dart';

abstract class CommonRepository {
  Future<List<Photo>> getPhotos(int page, int perPage);

  Future<List<Collection>> getCollections(int page, int perPage);

  Future<List<Photo>> getCollectionPhotos(String id, int page, int perPage);

  Future<List<Photo>> getPhotosFromSearch(
      String keyWord, int page, int perPage);

  Future downloadImage(Photo photo);
}
