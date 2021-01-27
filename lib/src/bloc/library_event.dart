part of 'library_bloc.dart';

@immutable
abstract class LibraryEvent {}

class ShowHome extends LibraryEvent {}

class ShowSearch extends LibraryEvent {}

class ShowSettings extends LibraryEvent {}

class SearchTypeSelectEvent extends LibraryEvent {
  final SearchType searchType;

  SearchTypeSelectEvent(this.searchType);
}

class SearchEntryEvent extends LibraryEvent {
  final String searchQuery;

  SearchEntryEvent(this.searchQuery);
}

class SearchEvent extends LibraryEvent {
  final SearchType searchType;

  SearchEvent(this.searchType);
}
