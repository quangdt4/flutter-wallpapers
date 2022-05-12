import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wallpapers/data/network/repository/common_repo.dart';
import 'package:flutter_wallpapers/states/collections/collections_event.dart';
import 'package:flutter_wallpapers/states/collections/collections_state.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  static const int collectionsPerPage = 20;

  final CommonRepository _photoRepository;

  CollectionsBloc(this._photoRepository)
      : super(const CollectionsState.initial()) {
    on<CollectionsEvent>((event, emit) async {
      if (event is GetData) {
        try {
          final newState = state.copyWith(
              listCollection:
                  await _photoRepository.getCollections(0, collectionsPerPage));
          emit(newState);
        } on Exception catch (e) {
          print(e);
        }
      } else if (event is GetCollectionPhotos) {
        try {
          final newState = state.copyWith(
              listCollectionPhotos: await _photoRepository.getCollectionPhotos(
                  event.id, 0, collectionsPerPage));
          emit(newState);
        } on Exception catch (e) {
          print(e);
        }
      } else if (event is ResetData) {
        final newState = state.copyWith(listCollectionPhotos: []);
        emit(newState);
      }
    });
  }
}
