// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return GameState(
    _$enumDecodeNullable(_$SearchTypeEnumMap, json['searchType']),
    json['gameSearchResult'] == null
        ? null
        : GameSearchResult.fromJson(
            json['gameSearchResult'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GameStateToJson(GameState instance) => <String, dynamic>{
      'searchType': _$SearchTypeEnumMap[instance.searchType],
      'gameSearchResult': instance.gameSearchResult,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SearchTypeEnumMap = {
  SearchType.Movie: 'Movie',
  SearchType.Book: 'Book',
  SearchType.Music: 'Music',
  SearchType.Game: 'Game',
  SearchType.TVShow: 'TVShow',
  SearchType.Podcast: 'Podcast',
};
