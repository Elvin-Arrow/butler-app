// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicState _$MusicStateFromJson(Map<String, dynamic> json) {
  return MusicState(
    _$enumDecodeNullable(_$SearchTypeEnumMap, json['searchType']),
    json['musicSearchResult'] == null
        ? null
        : MusicSearchResult.fromJson(
            json['musicSearchResult'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MusicStateToJson(MusicState instance) =>
    <String, dynamic>{
      'searchType': _$SearchTypeEnumMap[instance.searchType],
      'musicSearchResult': instance.musicSearchResult,
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
