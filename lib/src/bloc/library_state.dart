part of 'library_bloc.dart';

@immutable
abstract class LibraryState {}

class LibraryInitial extends LibraryState {}

class SearchingLibrary extends LibraryState {}

class ResultState extends LibraryState {
  final MovieSearchResult movieSearchResult;

  ResultState(this.movieSearchResult);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ResultState && o.movieSearchResult == movieSearchResult;
  }

  @override
  int get hashCode => movieSearchResult.hashCode;
}
