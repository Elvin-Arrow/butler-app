part of 'library_bloc.dart';

@immutable
abstract class LibraryEvent {}

class SearchEntryEvent extends LibraryEvent {
  final String searchQuery;

  SearchEntryEvent(this.searchQuery);
}

class SearchEvent extends LibraryEvent {
  final SearchType searchType;

  SearchEvent(this.searchType);
}
