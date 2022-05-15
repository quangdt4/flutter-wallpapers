import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wallpapers/data/network/repository/common_repo.dart';
import 'package:flutter_wallpapers/states/photos/photo_event.dart';
import 'package:flutter_wallpapers/states/photos/photo_state.dart';

import '../../data/model/storage.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  static const int photosPerPage = 20;

  final CommonRepository _photoRepository;

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
      } else if (event is GetDataFromSearch) {
        try {
          final newState = state.copyWith(
              listPhoto: await _photoRepository.getPhotosFromSearch(
                  event.keyWord, 0, photosPerPage));
          emit(newState);
        } on Exception catch (e) {
          print(e);
        }
      } else if (event is ResetPhotoData) {
        final newState = state.copyWith(listPhoto: []);
        emit(newState);
      } else if (event is InitLocalSave) {
        final newState = state.copyWith(isLocalSaved: event.photo.isLocalSaved);
        emit(newState);
      } else if (event is LocalSave) {
        if (event.photo.isLocalSaved == false) {
          listLocalSaved.add(event.photo);
          event.photo.isLocalSaved = true;
          print('add $listLocalSaved');
          final newState = state.copyWith(isLocalSaved: true);
          emit(newState);
        } else if (event.photo.isLocalSaved == true) {
          listLocalSaved.remove(event.photo);
          event.photo.isLocalSaved = false;
          print('remove $listLocalSaved');
          final newState = state.copyWith(isLocalSaved: false);
          emit(newState);
        }
      }
    });
  }
}
