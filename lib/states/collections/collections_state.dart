

import '../../data/network/response/collection_item_res.dart';
import '../../data/network/response/photo_res.dart';

class CollectionsState {
  final List<Collection> listCollection;
  final List<Photo> listCollectionPhotos;
  final int selectedCollectionIndex;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  Collection get selectedCollection => listCollection[selectedCollectionIndex];

  const CollectionsState._({
    this.listCollection = const [],
    this.listCollectionPhotos = const [],
    this.selectedCollectionIndex = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const CollectionsState.initial() : this._();

  CollectionsState copyWith({
    List<Collection>? listCollection,
    List<Photo>? listCollectionPhotos,
    int? selectedCollectionIndex,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return CollectionsState._(
      listCollection: listCollection ?? this.listCollection,
      listCollectionPhotos: listCollectionPhotos ?? this.listCollectionPhotos,
      selectedCollectionIndex:
          selectedCollectionIndex ?? this.selectedCollectionIndex,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
