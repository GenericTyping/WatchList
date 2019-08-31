
import 'package:watchlist/backend/api/api.dart';

abstract class Repository {
  Repository(this.api);

  final Api api;
}
