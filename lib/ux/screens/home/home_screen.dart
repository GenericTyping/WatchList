import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:watchlist/backend/api/mock/mock_saved_movies.dart';
import 'package:watchlist/backend/backend.dart';
import 'package:watchlist/backend/models/models.dart';
import 'package:watchlist/ux/theme.dart';
import 'package:watchlist/ux/widgets/value_stream_builder.dart';

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
            child: ValueStreamBuilder<KtList<SavedMovie>>(
              valueStream: Backend.of(context).movieRepository.savedMovies,
              builder: (context, savedMovies) {
                final movies = savedMovies.isNotEmpty() ? savedMovies.asList() : mockSavedMovies;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('top'),
                    for (final savedMovie in movies) ...[
                      Text(savedMovie.movie.title),
                      Text(
                        'Rating: ${savedMovie.rating}, currently watching: ${savedMovie.isWatching}',
                        style: const TextStyle(color: AppTheme.colorAccent),
                      ),
                      const SizedBox(height: 4),
                      CupertinoButton.filled(
                        onPressed: () {
                          Backend.of(context).movieRepository.addSavedMovie(savedMovie);
                        },
                        child: const Text('Create duplicate.'),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
