import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/backend/backend.dart';
import 'package:watchlist/ux/theme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Watch List'),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (final savedMovie in Backend.of(context).movieRepository.getAllSavedMovies()) ...[
                  Text(savedMovie.movie.title),
                  Text(
                    'Rating: ${savedMovie.rating}, currently watching: ${savedMovie.isWatching}',
                    style: const TextStyle(color: AppTheme.colorAccent),
                  ),
                  const SizedBox(height: 4),
                  CupertinoButton.filled(
                    onPressed: () => Backend.of(context).movieRepository.addSavedMovie(savedMovie),
                    child: const Text('Create duplicate.'),
                  ),
                  const SizedBox(height: 32),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
