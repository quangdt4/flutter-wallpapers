import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wallpapers/states/photos/photo_event.dart';
import 'package:flutter_wallpapers/states/photos/photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(const PhotoState.initial());
}
