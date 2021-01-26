import 'package:butler_app/src/resources/library_repository.dart';
import 'package:butler_app/src/resources/services/music_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music_state.g.dart';

@JsonSerializable()
class MusicState {
  final SearchType searchType;
  final MusicSearchResult musicSearchResult;

  MusicState(this.searchType, this.musicSearchResult);

  factory MusicState.fromJson(Map<String, dynamic> json) =>
      _$MusicStateFromJson(json);

  Map<String, dynamic> toJson() => _$MusicStateToJson(this);
}
