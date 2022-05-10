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
        _getData(event, emit);
      } else if (event is LoadMore) {
        _onLoadMore(event, emit);
      }
    });
  }

  void _getData(GetData event, Emitter<PhotoState> emit) async {
    try {
      final data = await _photoRepository.getPhotos(0, photosPerPage);
      final newState = state.copyWith(listPhoto: data);
      emit(newState);
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
    }
  }

  void _onLoadMore(LoadMore event, Emitter<PhotoState> emit) {
    // final currentState = state;
    // int currentPage = currentState.page;
    // final photos = await _photoRepository.getPhotos(currentPage++);
    // print("current_page = $currentPage");
  }
}
