import 'dart:async';

import 'package:watchlist/backend/config.dart';

class ApiEnv {
  const ApiEnv._({
    this.movieDbApiKey,
  });

  final String movieDbApiKey;

  static const live = ApiEnv._(
    movieDbApiKey: kMovieDbApiKey,
  );
}

abstract class Api {
  const Api(this.env);

  final ApiEnv env;

  // TODO: Add calls
}
