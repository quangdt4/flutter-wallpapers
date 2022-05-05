import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wallpapers/states/navigation/nav_event.dart';
import 'package:flutter_wallpapers/states/navigation/nav_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState.initial()) {
    on<NavigationEvent>((event, emit) async {
      if (event is TabChange) {
        final newState = state.copyWith(selectedItem: event.selectedTab);
        emit(newState);
      }
    });
  }
}
