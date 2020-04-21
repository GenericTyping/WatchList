// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return SearchResult(
    page: json['page'] as int,
    totalResults: json['total_results'] as int,
    totalPages: json['total_pages'] as int,
    results: (json['results'] as List)
        ?.map((e) => e == null ? null : SearchResultMovie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) => <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };

SearchResultMovie _$SearchResultMovieFromJson(Map<String, dynamic> json) {
  return SearchResultMovie(
    popularity: (json['popularity'] as num)?.toDouble(),
    voteCount: json['vote_count'] as int,
    video: json['video'] as bool,
    posterPath: json['poster_path'] as String,
    id: json['id'] as int,
    adult: json['adult'] as bool,
    backdropPath: json['backdrop_path'] as String,
    originalLanguage: json['original_language'] as String,
    originalTitle: json['original_title'] as String,
    genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
    title: json['title'] as String,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    overview: json['overview'] as String,
    releaseDate: json['release_date'] as String,
  );
}

Map<String, dynamic> _$SearchResultMovieToJson(SearchResultMovie instance) => <String, dynamic>{
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'poster_path': instance.posterPath,
      'id': instance.id,
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'genre_ids': instance.genreIds,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
    };
