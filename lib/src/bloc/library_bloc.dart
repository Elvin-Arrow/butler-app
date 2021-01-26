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

      if (event.searchType == SearchType.Movie) {
        yield MovieResultState(_searchState.searchType, searchResult);
      }
      else if (event.searchType == SearchType.Book) {}
      else if (event.searchType == SearchType.Game) {}
      else if (event.searchType == SearchType.Music) {}
      else if (event.searchType == SearchType.Podcast) {}
      else if (event.searchType == SearchType.TVShow) {}
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
      final bookSearchResult =
          await _libraryRepository.searchBook(_searchQuery);
      return bookSearchResult;
        break;
      case SearchType.Game:
      final gameSearchResult =
          await _libraryRepository.searchGame(_searchQuery);
      return gameSearchResult;
        break;
      case SearchType.Music:
      final musicSearchResult =
          await _libraryRepository.searchMusic(_searchQuery);
      return musicSearchResult;
        break;
      case SearchType.Podcast:
      final podcastSearchResult =
          await _libraryRepository.searchPodcast(_searchQuery);
      return podcastSearchResult;
        break;
      case SearchType.TVShow:
      final tvShowSearchResult =
          await _libraryRepository.searchTvShow(_searchQuery);
      return tvShowSearchResult;
        break;
      default:
    }
  }
}
