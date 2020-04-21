import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:watchlist/backend/models/models.dart';

part 'saved_movie.g.dart';

enum WatchingStatus {
  notWatched,
  watched,
}

@JsonSerializable()
class SavedMovie {
  const SavedMovie({
    @required this.movie,
    @required this.watchingStatus,
    this.rating,
  });

  const SavedMovie.empty({@required this.movie})
      : watchingStatus = WatchingStatus.notWatched,
        rating = null;

  final Movie movie;
  final WatchingStatus watchingStatus;
  final int rating;

  bool get isWatched => watchingStatus == WatchingStatus.watched;
  bool get hasRating => rating != null;
  double get ratingPercentage => rating / 10.0;

  factory SavedMovie.fromJson(Map<String, dynamic> json) => _$SavedMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SavedMovieToJson(this);
}
