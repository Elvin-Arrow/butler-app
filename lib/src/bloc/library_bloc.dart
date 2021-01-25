import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:butler_app/src/resources/library_repository.dart';
import 'package:butler_app/src/resources/services/movie_service.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  String _searchQuery;
  final LibraryRepository _libraryRepository;

  LibraryBloc(
    this._libraryRepository,
  ) : super(LibraryInitial());

  @override
  Stream<LibraryState> mapEventToState(
    LibraryEvent event,
  ) async* {
    if (event is SearchEntryEvent) {
      _searchQuery = event.searchQuery;
    } else if (event is SearchEvent) {
      yield SearchingLibrary();

      final movieSearchResult =
          await _libraryRepository.searchMovie(_searchQuery);

      yield ResultState(movieSearchResult);
    }
  }
}
