import '../../data/network/response/photo_res.dart';

abstract class PhotoEvent {
  const PhotoEvent();
}

class GetData extends PhotoEvent {}

class GetDataFromSearch extends PhotoEvent {
  final String keyWord;

  GetDataFromSearch(this.keyWord);
}

class LoadMore extends PhotoEvent {}

class ResetPhotoData extends PhotoEvent {}

class LocalSave extends PhotoEvent {
  final Photo photo;

  LocalSave(this.photo);
}

class InitLocalSave extends PhotoEvent {
  final Photo photo;

  InitLocalSave(this.photo);
}