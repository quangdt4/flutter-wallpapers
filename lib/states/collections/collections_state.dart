

import '../../data/network/response/collection_item_res.dart';

class CollectionsState {
  final List<Collection> listCollection;
  final int selectedCollectionIndex;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  Collection get selectedCollection => listCollection[selectedCollectionIndex];

  const CollectionsState._({
    this.listCollection = const [],
    this.selectedCollectionIndex = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const CollectionsState.initial() : this._();

  CollectionsState copyWith({
    List<Collection>? listCollection,
    int? selectedCollectionIndex,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return CollectionsState._(
      listCollection: listCollection ?? this.listCollection,
      selectedCollectionIndex:
          selectedCollectionIndex ?? this.selectedCollectionIndex,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
