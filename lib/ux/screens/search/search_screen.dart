import 'package:create_atom/create_atom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/backend/backend.dart';
import 'package:watchlist/backend/models/models.dart';
import 'package:watchlist/ux/theme.dart';
import 'package:time/time.dart';

// FIXME: UI is temporary.
class SearchScreen extends StatelessWidget {
  const SearchScreen();

  static const _searchQuery = 'LEGO';

  Future<void> _onTapMovie(BuildContext context, SearchResultMovie searchResultMovie) async {
    final movieRepository = Backend.of(context).movieRepository;

    final movie = await movieRepository.getMovie(searchResultMovie.id);
    movieRepository.addSavedMovie(SavedMovie.empty(movie: movie));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Search: "$_searchQuery"'),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder<SearchResult>(
              future: Backend.of(context).movieRepository.searchMovie(_searchQuery),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  // ignore: only_throw_errors
                  throw snapshot.error;
                }

                if (!snapshot.hasData) {
                  return Center(
                    child: Atom(
                      nucleusColor: AppTheme.colorAccent,
                      electronsColor: AppTheme.colorAccent,
                      orbitsColor: AppTheme.colorContrasting,
                      scale: 0.3,
                      animDuration1: 700.milliseconds,
                      animDuration2: 900.milliseconds,
                      animDuration3: 1200.milliseconds,
                    ),
                  );
                }

                return Material(
                  type: MaterialType.transparency,
                  child: Theme(
                    data: ThemeData.dark(),
                    child: Column(
                      children: <Widget>[
                        for (final movie in snapshot.data.results)
                          ListTile(
                            onTap: () => _onTapMovie(context, movie),
                            title: Text(movie.title),
                            subtitle: Text('${movie.id}'),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
