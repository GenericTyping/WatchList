import 'package:meta/meta.dart';
import 'package:watchlist/backend/api/api.dart';
import 'package:watchlist/backend/stores/store.dart';

export 'api/api.dart';

class Backend {
  Backend._({
    @required this.appState,
  });

  static Future<Backend> init(Api api) async {
    // TODO: Implement init.
  }

  final AppStateStore appState;
  // TODO: Add repositories.

}
