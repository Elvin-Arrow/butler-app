part of 'library_bloc.dart';

@immutable
abstract class LibraryState {}

class LibraryInitial extends LibraryState {}

class SearchingLibrary extends LibraryState {}

class MovieResultState extends LibraryState {
  final MovieSearchResult searchResult;

  MovieResultState(this.searchResult);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovieResultState && o.searchResult == searchResult;
  }

  @override
  int get hashCode => searchResult.hashCode;
}
