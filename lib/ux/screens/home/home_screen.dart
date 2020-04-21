import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:watchlist/backend/backend.dart';
import 'package:watchlist/backend/models/models.dart';
import 'package:watchlist/ux/theme.dart';
import 'package:watchlist/ux/widgets/value_stream_builder.dart';

// FIXME: UI is temporary.
class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Watch List'),
          ),
          SliverToBoxAdapter(
            child: ValueStreamBuilder<KtList<SavedMovie>>(
              valueStream: Backend.of(context).movieRepository.savedMovies,
              builder: (context, savedMovies) {
                if (savedMovies.isEmpty()) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('No saved movies.\nClick on a search result to save the movie.'),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Divider(
                        height: 32,
                        color: AppTheme.colorContrasting.withOpacity(0.5),
                      ),
                      for (final savedMovie in savedMovies.iter) ...[
                        Text(savedMovie.movie.title),
                        Text(
                          'Rating: ${savedMovie.rating}, currently watching: ${savedMovie.isWatched}',
                          style: const TextStyle(color: AppTheme.colorAccent),
                        ),
                        const SizedBox(height: 4),
                        Divider(
                          height: 32,
                          color: AppTheme.colorContrasting.withOpacity(0.5),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
