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