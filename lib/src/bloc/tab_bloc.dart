import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabInitial());

  @override
  Stream<TabState> mapEventToState(
    TabEvent event,
  ) async* {
    if (event is TabChangeEvent) {
      final state = _getCorrespondingState(event.tabIndex);

      yield state;
    }
  }

  TabState _getCorrespondingState(int tabIndex) {
    if (tabIndex == 1) {
      return SearchTab();
    } else if (tabIndex == 2) {
      return SettingsTab();
    } else {
      return TabInitial();
    }
  }
}
