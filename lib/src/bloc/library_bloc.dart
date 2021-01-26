// part of 'library_bloc.dart';
import 'package:flutter/material.dart';
import 'package:butler_app/src/models/book_state.dart';
import 'package:butler_app/src/models/game_state.dart';
import 'package:butler_app/src/models/music_state.dart';
import 'package:butler_app/src/models/podcast_state.dart';
import 'package:butler_app/src/models/tv_show_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:butler_app/src/resources/library_repository.dart';
import 'package:butler_app/src/models/movie_state.dart';
part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends HydratedBloc<LibraryEvent, LibraryState> {
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
        final movieState = MovieState(_searchState.searchType, searchResult);
        yield MovieResultState(movieState);
      } else if (event.searchType == SearchType.Book) {
        final bookState = BookState(_searchState.searchType, searchResult);
        yield BookResultState(bookState);
      } else if (event.searchType == SearchType.Game) {
        final gameState = GameState(_searchState.searchType, searchResult);
        yield GameResultState(gameState);
      } else if (event.searchType == SearchType.Music) {
        final musicState = MusicState(_searchState.searchType, searchResult);
        yield MusicResultState(musicState);
      } else if (event.searchType == SearchType.Podcast) {
        final podcastState = PodcastState(_searchState.searchType, searchResult);
        yield PodcastResultState(podcastState);
      } else if (event.searchType == SearchType.TVShow) {
        final tvShowState = TVShowState(_searchState.searchType, searchResult);
        yield TvShowResultState(tvShowState);
      }
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
      case SearchType.Book:
        final bookSearchResult =
        await _libraryRepository.searchBook(_searchQuery);
        return bookSearchResult;
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

  @override
  LibraryState fromJson(Map<String, dynamic> json) {
    try {
      final searchResult = MovieState.fromJson(json);
      return MovieResultState(searchResult);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(LibraryState state) {
    if (state is MovieResultState) {
      return state.movieState.toJson();
    } else {
      return null;
    }
  }
}
