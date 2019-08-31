import 'package:watchlist/backend/api/mock/mock_movies.dart';
import 'package:watchlist/backend/models/models.dart';

const mockSavedMovies = <SavedMovie>[
  SavedMovie(
    movie: mockMovieStarWars,
    watchingStatus: WatchingStatus.currentlyWatching,
    rating: 7,
  ),
  SavedMovie(
    movie: mockMovieStarWars,
    watchingStatus: WatchingStatus.notWatching,
    rating: 3,
  ),
  SavedMovie(
    movie: mockMovieStarWars,
    watchingStatus: WatchingStatus.notWatching,
    rating: 9,
  ),
];
