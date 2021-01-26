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
  SearchState _searchState;

  LibraryBloc(
    this._libraryRepository,
  ) : super(LibraryInitial());

  @override
  Stream<LibraryState> mapEventToState(
    LibraryEvent event,
  ) async* {
    if (event is SearchTypeSelectEvent) {
      _searchState = SearchState(event.searchType);

      yield SearchState(event.searchType);
    } else if (event is SearchEntryEvent) {
      _searchQuery = event.searchQuery;
    } else if (event is SearchEvent) {
      yield SearchingLibrary(_searchState.searchType);

      final searchResult = await _invokeSearchAPI(event.searchType);

      yield MovieResultState(_searchState.searchType, searchResult);
    }
  }

  /// Method to invoke search API based on selected search type.
  ///
  Future _invokeSearchAPI(SearchType searchType) async {
    switch (searchType) {
      case SearchType.Movie:
        final movieSearchResult =
            await _libraryRepository.searchMovie(_searchQuery);
        return movieSearchResult;
        break;
      case SearchType.Book:
        // TODO add book search API binding
        break;
      case SearchType.Game:
        // TODO add game search API binding
        break;
      case SearchType.Music:
        // TODO add music search API binding
        break;
      case SearchType.Podcast:
        // TODO add podcast search API binding
        break;
      case SearchType.TVShow:
        // TODO add TV show search API binding
        break;
      default:
    }
  }
}
