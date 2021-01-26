import 'package:butler_app/src/resources/library_repository.dart';
import 'package:butler_app/src/resources/services/podcast_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'podcast_state.g.dart';

@JsonSerializable()
class PodcastState {
  final SearchType searchType;
  final PodcastSearchResult podcastSearchResult;

  PodcastState(this.searchType, this.podcastSearchResult);

  factory PodcastState.fromJson(Map<String, dynamic> json) =>
      _$PodcastStateFromJson(json);

  Map<String, dynamic> toJson() => _$PodcastStateToJson(this);
}
