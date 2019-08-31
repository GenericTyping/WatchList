import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'movie.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Movie {
  const Movie({
    @required this.adult,
    @required this.backdropPath,
    @required this.belongsToCollection,
    @required this.budget,
    @required this.genres,
    @required this.homepage,
    @required this.id,
    @required this.imdbId,
    @required this.originalLanguage,
    @required this.originalTitle,
    @required this.overview,
    @required this.popularity,
    @required this.posterPath,
    @required this.productionCompanies,
    @required this.productionCountries,
    @required this.releaseDate,
    @required this.revenue,
    @required this.runtime,
    @required this.spokenLanguages,
    @required this.status,
    @required this.tagline,
    @required this.title,
    @required this.video,
    @required this.voteAverage,
    @required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final MovieCollection belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class MovieCollection {
  const MovieCollection({
    @required this.id,
    @required this.name,
    @required this.posterPath,
    @required this.backdropPath,
  });

  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;

  factory MovieCollection.fromJson(Map<String, dynamic> json) => _$MovieCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCollectionToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Genre {
  const Genre({
    @required this.id,
    @required this.name,
  });

  final int id;
  final String name;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class ProductionCompany {
  const ProductionCompany({
    @required this.id,
    @required this.logoPath,
    @required this.name,
    @required this.originCountry,
  });

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class ProductionCountry {
  const ProductionCountry({
    @required this.iso31661,
    @required this.name,
  });

  final String iso31661;
  final String name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class SpokenLanguage {
  const SpokenLanguage({
    @required this.iso6391,
    @required this.name,
  });

  final String iso6391;
  final String name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
