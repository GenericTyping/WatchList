import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touch_indicator/touch_indicator.dart';
import 'package:watchlist/backend/api/movie_db_api.dart';
import 'package:watchlist/backend/backend.dart';
import 'package:watchlist/ux/containers/main_container.dart';
import 'package:watchlist/ux/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final backend = await Backend.init(const MovieDbApi(ApiEnv.live));
  // FIXME: Will reset local storage every time app is run.
  backend.appState.clear();
  runApp(WatchList(backend: backend));
}

class WatchList extends StatelessWidget {
  const WatchList({
    Key key,
    @required this.backend,
  }) : super(key: key);

  final Backend backend;

  @override
  Widget build(BuildContext context) {
    return Provider<Backend>.value(
      value: backend,
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(),
        title: 'Watch List',
        home: TouchIndicator(
          indicatorColor: const Color(0xFFFFFFFF),
          child: MainContainer(),
        ),
      ),
    );
  }
}
