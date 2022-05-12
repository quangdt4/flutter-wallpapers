abstract class CollectionsEvent {
  const CollectionsEvent();
}

class GetData extends CollectionsEvent {}

class LoadMore extends CollectionsEvent {}

class GetCollectionPhotos extends CollectionsEvent {
  final String id;

  GetCollectionPhotos(this.id);
}

class ResetData extends CollectionsEvent {}

