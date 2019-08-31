import 'package:flutter/cupertino.dart';
import 'package:touch_indicator/touch_indicator.dart';
import 'package:watchlist/ux/containers/main_container.dart';
import 'package:watchlist/ux/theme.dart';

void main() => runApp(WatchList());

class WatchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      title: 'Watch List',
      home: TouchIndicator(
        indicatorColor: const Color(0xFFFFFFFF),
        child: MainContainer(),
      ),
    );
  }
}
