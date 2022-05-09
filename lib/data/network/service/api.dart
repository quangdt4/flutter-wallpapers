import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_wallpapers/data/network/response/photo_res.dart';
import 'package:retrofit/http.dart';


part 'api.g.dart';

@RestApi(baseUrl: "https://api.unsplash.com/")
abstract class AppApi {
  factory AppApi(Dio dio) = _AppApi;

  @Headers(<String, bool>{"authenticate": false})
  @GET("/photos")
  Future<List<Photo>> getListPhotos(
      @Query('page') int page, @Query('per_page') int perPage);
}
