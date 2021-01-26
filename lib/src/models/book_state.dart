import 'package:butler_app/src/resources/library_repository.dart';
import 'package:butler_app/src/resources/services/books_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_state.g.dart';

@JsonSerializable()
class BookState {
  final SearchType searchType;
  final BookSearchResult bookSearchResult;

  BookState(this.searchType, this.bookSearchResult);

  factory BookState.fromJson(Map<String, dynamic> json) =>
      _$BookStateFromJson(json);

  Map<String, dynamic> toJson() => _$BookStateToJson(this);
}
