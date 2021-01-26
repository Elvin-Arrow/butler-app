import 'package:butler_app/src/resources/library_repository.dart';
import 'package:butler_app/src/resources/services/movie_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_state.g.dart';

@JsonSerializable()
class MovieState {
  final SearchType searchType;
  final MovieSearchResult searchResult;

  MovieState(this.searchType, this.searchResult);

  factory MovieState.fromJson(Map<String, dynamic> json) =>
      _$MovieStateFromJson(json);

  Map<String, dynamic> toJson() => _$MovieStateToJson(this);
}
