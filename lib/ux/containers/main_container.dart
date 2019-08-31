import 'package:flutter/cupertino.dart';
import 'package:watchlist/ux/screens/home/home_screen.dart';

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bluetooth),
            title: const Text('PageOne'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bus),
            title: const Text('PageTwo'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return HomeScreen();
      },
    );
  }
}
