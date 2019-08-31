import 'package:app/backend/api/api.dart';

export 'playlist_repository.dart';
export 'user_repository.dart';
export 'video_repository.dart';

abstract class Repository {
  Repository(this.api);

  final Api api;
}
