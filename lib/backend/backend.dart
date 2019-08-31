import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:watchlist/backend/api/api.dart';
import 'package:watchlist/backend/repositories/repository.dart';
import 'package:watchlist/backend/stores/store.dart';

export 'api/api.dart';

class Backend {
  Backend._({
    @required this.appState,
    @required this.movieRepository,
  });

  static Future<Backend> init(Api api) async {
    final appState = await AppStateStore.init();

    return Backend._(
      appState: appState,
      movieRepository: MovieRepository(api, appState),
    );
  }

  static Backend of(BuildContext context) {
    return Provider.of<Backend>(context);
  }

  final AppStateStore appState;
  final MovieRepository movieRepository;

}
