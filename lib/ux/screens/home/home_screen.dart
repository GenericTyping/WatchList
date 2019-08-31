import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/ux/theme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: const Text('Watch List'),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 1200.0,
              color: AppTheme.colorAccent,
            ),
          ),
        ],
      ),
    );
  }
}
