import 'package:dio/dio.dart';

import '../response/photo_res.dart';

abstract class PhotoRepository {
  Future<List<Photo>> getPhotos(int page, int perPage);
}

class PhotoDefaultRepository implements PhotoRepository {
  @override
  Future<List<Photo>> getPhotos(int page, int perPage) async {
    try {
      Response response = await Dio().get(
          "https://api.unsplash.com/photos/?client_id=e2658d4b6b17ae24b50a7ab36d13ca67da9761322a5e4cb0e9cc531e69cecb90&page=$page");

      List<Photo> list =
          PhotoListResponse.fromJsonArray(response.data).results;
      list.forEach((value){
        print(value.color);
      });
      print(list.length);
      return list;
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return null;
    }
  }
}