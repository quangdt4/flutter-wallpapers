import 'package:flutter_wallpapers/data/network/source/photo_data_source.dart';
import 'package:injectable/injectable.dart';

import '../network/response/photo_res.dart';

abstract class PhotoRepository {
  Future<List<Photo>> getPhotoList(int page, int perPage);
}

@Injectable(as: PhotoRepository)
class PhotoDefaultRepository extends PhotoRepository {
  PhotoDefaultRepository({required this.photoDataSource});

  final PhotoDataSource photoDataSource;

  @override
  Future<List<Photo>> getPhotoList(int page, int perPage) async {
    try {
      List<Photo> data = await photoDataSource.getPhotoList(page, perPage);
      return data;
    } catch (error, stacktrace) {
      print('data error: => $error');
      print('data error: => $stacktrace');
      return [];
    }
  }
}
