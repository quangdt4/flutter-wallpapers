import '../../data/model/Photo.dart';

enum PhotoStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
}

class PhotoState {
  final PhotoStateStatus status;
  final List<Photo> listPhoto;
  final int selectedPhotoIndex;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  Photo get selectedPhoto => listPhoto[selectedPhotoIndex];

  const PhotoState._({
    this.status = PhotoStateStatus.initial,
    this.listPhoto = const [],
    this.selectedPhotoIndex = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const PhotoState.initial() : this._();

  PhotoState asLoading() {
    return copyWith(
      status: PhotoStateStatus.loading,
    );
  }

  PhotoState asLoadSuccess(List<Photo> photo, {bool canLoadMore = true}) {
    return copyWith(
      status: PhotoStateStatus.loadSuccess,
      listPhoto: photo,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  PhotoState asLoadFailure(Exception e) {
    return copyWith(
      status: PhotoStateStatus.loadFailure,
      error: e,
    );
  }

  PhotoState asLoadingMore() {
    return copyWith(status: PhotoStateStatus.loadingMore);
  }

  PhotoState asLoadMoreSuccess(List<Photo> newListPhotoLoaded,
      {bool canLoadMore = true}) {
    return copyWith(
      status: PhotoStateStatus.loadMoreSuccess,
      listPhoto: [...listPhoto, ...newListPhotoLoaded],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  PhotoState asLoadMoreFailure(Exception e) {
    return copyWith(
      status: PhotoStateStatus.loadMoreFailure,
      error: e,
    );
  }

  PhotoState copyWith({
    PhotoStateStatus? status,
    List<Photo>? listPhoto,
    int? selectedPhotoIndex,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return PhotoState._(
      status: status ?? this.status,
      listPhoto: listPhoto ?? this.listPhoto,
      selectedPhotoIndex: selectedPhotoIndex ?? this.selectedPhotoIndex,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
