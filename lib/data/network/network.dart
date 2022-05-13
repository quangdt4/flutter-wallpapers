import 'package:dio/dio.dart' show Dio, Response;
import 'package:flutter_wallpapers/data/network/repository/common_repo.dart';
import 'package:flutter_wallpapers/data/network/response/collection_item_res.dart';
import 'package:flutter_wallpapers/data/network/response/photo_res.dart';
import 'package:flutter_wallpapers/data/network/response/search_photos_res.dart';

class NetworkService implements CommonRepository {
  static String baseUrl = 'https://api.unsplash.com/';

  static String apiKey = 'Sai9GwaGE-QgaNy1jeDfDWrUyl8XAy2l5Z0Km-1QE8Q';

  static String scrKey = 'TcaaJoiDGNY9JwXEAw9g8rjbtajpLfnHsVVBqiC54bc';

  @override
  Future<List<Photo>> getPhotos(int page, int perPage) async {
    try {
      Response response = await Dio().get(
          "https://api.unsplash.com/photos/?client_id=$apiKey&page=$page&per_page=20");

      List<Photo> list = PhotoListResponse.fromJsonArray(response.data).results;
      print(list.length);
      return list;
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return [];
    }
  }

  @override
  Future<List<Collection>> getCollections(int page, int perPage) async {
    try {
      Response response = await Dio().get(
          "https://api.unsplash.com/collections/?client_id=$apiKey&page=$page&per_page=20");

      List<Collection> list =
          CollectionListResponse.fromJsonArray(response.data).results;
      print(list.length);
      return list;
    } catch (error, stacktrace) {
      print('ERROR: $error');
      print(stacktrace);
      return [];
    }
  }

  @override
  Future<List<Photo>> getCollectionPhotos(
      String id, int page, int perPage) async {
    try {
      Response response = await Dio().get(
          "https://api.unsplash.com/collections/$id/photos/?client_id=$apiKey&page=$page&per_page=20");

      List<Photo> list = PhotoListResponse.fromJsonArray(response.data).results;
      print(list.length);
      return list;
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return [];
    }
  }

  @override
  Future<List<Photo>> getPhotosFromSearch(
      String keyWord, int page, int perPage) async {
    try {
      Response response = await Dio().get(
          "https://api.unsplash.com/search/photos/?client_id=$apiKey&page=$page&query=$keyWord&per_page=20");

      List<Photo>? list = SearchPhotoResponse.fromJson(response.data).results;
      print(list?.length);
      return list ?? [];
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return [];
    }
  }
}
