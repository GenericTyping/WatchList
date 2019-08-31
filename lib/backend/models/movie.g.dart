// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    adult: json['adult'] as bool,
    backdropPath: json['backdrop_path'] as String,
    belongsToCollection: json['belongs_to_collection'] == null
        ? null
        : MovieCollection.fromJson(
            json['belongs_to_collection'] as Map<String, dynamic>),
    budget: json['budget'] as int,
    genres: (json['genres'] as List)
        ?.map(
            (e) => e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    homepage: json['homepage'] as String,
    id: json['id'] as int,
    imdbId: json['imdb_id'] as String,
    originalLanguage: json['original_language'] as String,
    originalTitle: json['original_title'] as String,
    overview: json['overview'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    posterPath: json['poster_path'] as String,
    productionCompanies: (json['production_companies'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCompany.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    productionCountries: (json['production_countries'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCountry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    releaseDate: json['release_date'] as String,
    revenue: json['revenue'] as int,
    runtime: json['runtime'] as int,
    spokenLanguages: (json['spoken_languages'] as List)
        ?.map((e) => e == null
            ? null
            : SpokenLanguage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as String,
    tagline: json['tagline'] as String,
    title: json['title'] as String,
    video: json['video'] as bool,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    voteCount: json['vote_count'] as int,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection?.toJson(),
      'budget': instance.budget,
      'genres': instance.genres?.map((e) => e?.toJson())?.toList(),
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies':
          instance.productionCompanies?.map((e) => e?.toJson())?.toList(),
      'production_countries':
          instance.productionCountries?.map((e) => e?.toJson())?.toList(),
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages':
          instance.spokenLanguages?.map((e) => e?.toJson())?.toList(),
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

MovieCollection _$MovieCollectionFromJson(Map<String, dynamic> json) {
  return MovieCollection(
    id: json['id'] as int,
    name: json['name'] as String,
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
  );
}

Map<String, dynamic> _$MovieCollectionToJson(MovieCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return Genre(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) {
  return ProductionCompany(
    id: json['id'] as int,
    logoPath: json['logo_path'] as String,
    name: json['name'] as String,
    originCountry: json['origin_country'] as String,
  );
}

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) {
  return ProductionCountry(
    iso31661: json['iso31661'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ProductionCountryToJson(ProductionCountry instance) =>
    <String, dynamic>{
      'iso31661': instance.iso31661,
      'name': instance.name,
    };

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) {
  return SpokenLanguage(
    iso6391: json['iso6391'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$SpokenLanguageToJson(SpokenLanguage instance) =>
    <String, dynamic>{
      'iso6391': instance.iso6391,
      'name': instance.name,
    };
