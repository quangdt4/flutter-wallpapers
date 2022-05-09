import 'package:flutter_wallpapers/data/network/response/photo_res.dart';
import 'package:flutter_wallpapers/data/network/service/api.dart';
import 'package:flutter_wallpapers/data/network/source/app_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AppDataSource, env: [Environment.dev, Environment.prod])
class PhotoDataSource implements AppDataSource{
  PhotoDataSource(this.appApi);

  final AppApi appApi;

  @override
  Future<List<Photo>> getPhotoList(int page, int perPage) async {
    List<Photo> rs = await appApi.getListPhotos(page, perPage);
    return rs;
  }
}
