// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedMovie _$SavedMovieFromJson(Map<String, dynamic> json) {
  return SavedMovie(
    movie: json['movie'] == null
        ? null
        : Movie.fromJson(json['movie'] as Map<String, dynamic>),
    watchingStatus:
        _$enumDecodeNullable(_$WatchingStatusEnumMap, json['watching_status']),
    rating: json['rating'] as int,
  );
}

Map<String, dynamic> _$SavedMovieToJson(SavedMovie instance) =>
    <String, dynamic>{
      'movie': instance.movie?.toJson(),
      'watching_status': _$WatchingStatusEnumMap[instance.watchingStatus],
      'rating': instance.rating,
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

const _$WatchingStatusEnumMap = {
  WatchingStatus.notWatching: 'notWatching',
  WatchingStatus.currentlyWatching: 'currentlyWatching',
};
