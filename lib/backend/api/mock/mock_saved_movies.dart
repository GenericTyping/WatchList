import 'package:watchlist/backend/api/mock/mock_movies.dart';
import 'package:watchlist/backend/models/models.dart';

const mockSavedMovies = <SavedMovie>[
  SavedMovie(
    movie: mockMovieStarWars,
    watchingStatus: WatchingStatus.watched,
    rating: 7,
  ),
  SavedMovie(
    movie: mockMovieStarWars,
    watchingStatus: WatchingStatus.notWatched,
    rating: 3,
  ),
  SavedMovie(
    movie: mockMovieStarWars,
    watchingStatus: WatchingStatus.notWatched,
    rating: 9,
  ),
];
