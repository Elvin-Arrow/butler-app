import 'package:butler_app/src/resources/library_repository.dart';
import 'package:butler_app/src/resources/services/tv_show_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_state.g.dart';

@JsonSerializable()
class TVShowState {
  final SearchType searchType;
  final TVShowSearchResult tvSearchResult;

  TVShowState(this.searchType, this.tvSearchResult);

  factory TVShowState.fromJson(Map<String, dynamic> json) =>
      _$TVShowStateFromJson(json);

  Map<String, dynamic> toJson() => _$TVShowStateToJson(this);
}
