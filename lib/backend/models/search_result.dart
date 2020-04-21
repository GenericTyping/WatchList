import 'package:json_annotation/json_annotation.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult {
  SearchResult({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  int page;
  int totalResults;
  int totalPages;
  List<SearchResultMovie> results;

  factory SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}

@JsonSerializable()
class SearchResultMovie {
  SearchResultMovie({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  double get voteAveragePercentage => voteAverage / 10.0;

  factory SearchResultMovie.fromJson(Map<String, dynamic> json) => _$SearchResultMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultMovieToJson(this);
}
