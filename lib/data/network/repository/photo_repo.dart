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
          "https://api.unsplash.com/photos/?client_id=Sai9GwaGE-QgaNy1jeDfDWrUyl8XAy2l5Z0Km-1QE8Q&page=$page");

      List<Photo> list = PhotoListResponse.fromJsonArray(response.data).results;
      print(list.length);
      return list;
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return [];
    }
  }
}
//
// class ClanRepository @Inject constructor(private var appApi: AppApi) {
//
// fun membersOfClan(limit: Int, offset: Int, clanId: Int): Observable<Response<ListUserResponse>> {
// return appApi.getMemberOfClan(limit = limit, offset = offset, clanId = clanId)
// }
//
// fun getListClan(limit: Int, offset: Int, userId: Int): Observable<Response<ClanResponse>> {
// return appApi.getListClan(limit, offset, userId)
// }
