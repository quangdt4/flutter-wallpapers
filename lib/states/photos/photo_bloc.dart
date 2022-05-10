import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wallpapers/states/photos/photo_event.dart';
import 'package:flutter_wallpapers/states/photos/photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  static const int photosPerPage = 20;

  // final PhotoRepository _photoRepository;

  PhotoBloc() : super(const PhotoState.initial()) {
    // on<PhotoEvent>((event, emit) async {
    //   if (event is GetData) {
    //     _getData(event, emit);
    //   } else if (event is LoadMore) {
    //     _onLoadMore(event, emit);
    //   }
    // });
  }

  // void _getData(GetData event, Emitter<PhotoState> emit) async {
  //   try {
  //     emit(state.asLoading());
  //
  //     var data = await _photoRepository.getPhotoList(1, photosPerPage);
  //
  //     emit(state.asLoadSuccess(data));
  //   } on Exception catch (e) {
  //   emit(state.asLoadFailure(e));
  //   }
  // }
  //
  // void _onLoadMore(LoadMore event, Emitter<PhotoState> emit) {}
}
