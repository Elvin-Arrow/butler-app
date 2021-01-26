part of 'library_bloc.dart';

@immutable
abstract class LibraryState {}

class LibraryInitial extends LibraryState {}

class SearchState extends LibraryState {
  final SearchType searchType;

  SearchState(this.searchType);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchState && o.searchType == searchType;
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
  final SearchType searchType;
  final MovieSearchResult searchResult;

  MovieResultState(
    this.searchType,
    this.searchResult,
  );

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovieResultState &&
        o.searchType == searchType &&
        o.searchResult == searchResult;
  }

  @override
  int get hashCode => searchType.hashCode ^ searchResult.hashCode;
}
