import 'package:watchlist/backend/api/api.dart';

export 'movie_repository.dart';

abstract class Repository {
  Repository(this.api);

  final Api api;
}
