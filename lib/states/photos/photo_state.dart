import '../../data/network/response/photo_res.dart';

class PhotoState {
  final List<Photo> listPhoto;
  final int selectedPhotoIndex;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  Photo get selectedPhoto => listPhoto[selectedPhotoIndex];

  const PhotoState._({
    this.listPhoto = const [],
    this.selectedPhotoIndex = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const PhotoState.initial() : this._();

  PhotoState copyWith({
    List<Photo>? listPhoto,
    int? selectedPhotoIndex,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return PhotoState._(
      listPhoto: listPhoto ?? this.listPhoto,
      selectedPhotoIndex: selectedPhotoIndex ?? this.selectedPhotoIndex,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}