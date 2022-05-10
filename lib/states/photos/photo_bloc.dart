import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wallpapers/data/network/repository/photo_repo.dart';
import 'package:flutter_wallpapers/states/photos/photo_event.dart';
import 'package:flutter_wallpapers/states/photos/photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  static const int photosPerPage = 20;

  final PhotoRepository _photoRepository;

  PhotoBloc(this._photoRepository) : super(const PhotoState.initial()) {
    on<PhotoEvent>((event, emit) async {
      if (event is GetData) {
        try {
          final newState = state.copyWith(
              listPhoto: await _photoRepository.getPhotos(0, photosPerPage));
          emit(newState);
        } on Exception catch (e) {
          print(e);
        }
      } else if (event is LoadMore) {}
    });
  }
}
