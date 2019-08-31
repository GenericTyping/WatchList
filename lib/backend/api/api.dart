import 'dart:async';

import 'package:watchlist/backend/config.dart';
import 'package:meta/meta.dart';
import 'package:watchlist/backend/models/models.dart';

class ApiEnv {
  const ApiEnv._({
    @required this.host,
    @required this.movieDbApiKey,
  });

  final String host;
  final String movieDbApiKey;

  static const live = ApiEnv._(
    host: 'https://api.themoviedb.org/3',
    movieDbApiKey: kMovieDbApiKey,
  );
}

abstract class Api {
  const Api(this.env);

  final ApiEnv env;

  Future<Movie> getMovie(int id);
  Future<SearchResult> searchMovie(String query);
}
