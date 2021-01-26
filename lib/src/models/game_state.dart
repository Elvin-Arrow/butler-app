import 'package:butler_app/src/resources/library_repository.dart';
import 'package:butler_app/src/resources/services/game_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_state.g.dart';

@JsonSerializable()
class GameState {
  final SearchType searchType;
  final GameSearchResult gameSearchResult;

  GameState(this.searchType, this.gameSearchResult);

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);

  Map<String, dynamic> toJson() => _$GameStateToJson(this);
}
