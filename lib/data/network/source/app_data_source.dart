import '../response/photo_res.dart';

abstract class AppDataSource {
  Future<List<Photo>> getPhotoList(int page, int perPage);
}