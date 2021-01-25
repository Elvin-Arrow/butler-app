import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial());

  @override
  Stream<MenuState> mapEventToState(
    MenuEvent event,
  ) async* {
    if (event is MovieEvent) {
      yield MovieState();
    } else if (event is MusicEvent) {
      yield MusicState();
    } else if (event is GameEvent) {
      yield GameState();
    } else if (event is BookEvent) {
      yield BookState();
    } else if (event is PodcastEvent) {
      yield PodcastState();
    } else if (event is TVShowEvent) {
      yield TVShowState();
    }
  }
}
