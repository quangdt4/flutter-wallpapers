import '../../data/network/response/photo_res.dart';

class PhotoState {
  final List<Photo> listPhoto;
  final int selectedPhotoIndex;
  final int page;
  final Exception? error;
  final bool isLocalSaved;

  Photo get selectedPhoto => listPhoto[selectedPhotoIndex];

  const PhotoState._({
    this.listPhoto = const [],
    this.selectedPhotoIndex = 0,
    this.page = 1,
    this.isLocalSaved = false,
    this.error,
  });

  const PhotoState.initial() : this._();

  PhotoState downloadingState() {
    return copyWith(selectedPhotoIndex: 1);
  }

  PhotoState downloadedState() {
    return copyWith(selectedPhotoIndex: 1);
  }

  PhotoState errorDownloadingState(Exception e) {
    return copyWith(error: e);
  }

  PhotoState copyWith({
    List<Photo>? listPhoto,
    int? selectedPhotoIndex,
    int? page,
    bool? isLocalSaved,
    Exception? error,
  }) {
    return PhotoState._(
      listPhoto: listPhoto ?? this.listPhoto,
      selectedPhotoIndex: selectedPhotoIndex ?? this.selectedPhotoIndex,
      page: page ?? this.page,
      isLocalSaved: isLocalSaved ?? this.isLocalSaved,
      error: error ?? this.error,
    );
  }
}

