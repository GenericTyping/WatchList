import 'package:flutter/cupertino.dart';
import 'package:watchlist/ux/screens/home/home_screen.dart';
import 'package:watchlist/ux/screens/search/search_screen.dart';

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.play_arrow),
            title: const Text('List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: const Text('Search'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const HomeScreen();
          case 1:
            return const SearchScreen();
          default:
            throw UnsupportedError('Screen does not exist for index $index');
        }
      },
    );
  }
}
