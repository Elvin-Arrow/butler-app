part of 'library_bloc.dart';

@immutable
abstract class LibraryState {}

class LibraryInitial extends LibraryState {}

class LibrarySearch extends LibraryState {}

class LibrarySettings extends LibraryState {}

class SearchTypeSelected extends LibraryState {
  final SearchType searchType;

  SearchTypeSelected(this.searchType);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchTypeSelected && o.searchType == searchType;
  }

  @override
  int get hashCode => searchType.hashCode;
}

class SearchingLibrary extends LibraryState {
  final SearchType searchType;

  SearchingLibrary(this.searchType);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchingLibrary && o.searchType == searchType;
  }

  @override
  int get hashCode => searchType.hashCode;
}

class MovieResultState extends LibraryState {
  final MovieState movieState;

  MovieResultState(
    this.movieState,
  );

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovieResultState && o.movieState == movieState;
  }

  @override
  int get hashCode => movieState.hashCode;
}

class BookResultState extends LibraryState {
  final BookState bookState;

  BookResultState(this.bookState);
}

class GameResultState extends LibraryState {
  final GameState gameState;

  GameResultState(this.gameState);
}

class PodcastResultState extends LibraryState {
  final PodcastState podcastState;

  PodcastResultState(this.podcastState);
}

class TvShowResultState extends LibraryState {
  final TVShowState tvShowState;

  TvShowResultState(this.tvShowState);
}

class MusicResultState extends LibraryState {
  final MusicState musicState;

  MusicResultState(this.musicState);
}
