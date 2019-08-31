import 'package:watchlist/backend/api/api.dart';
import 'package:watchlist/backend/models/models.dart';
import 'package:watchlist/backend/repositories/repository.dart';
import 'package:watchlist/backend/stores/store.dart';

class MovieRepository extends Repository {
  MovieRepository(Api api, this.appState) : super(api);

  final AppStateStore appState;

  // TODO: Add saved movies stream to store and then repository.
  // OR: make repository listenable.

  Iterable<SavedMovie> getAllSavedMovies() {
    return appState.savedMovies;
  }

  SavedMovie getSavedMovie(int id) {
    return appState.savedMovies.firstWhere(
      (savedMovie) => savedMovie.movie.id == id,
      orElse: () => null,
    );
  }

  // FIXME: Is temporary.
  void addSavedMovie(SavedMovie savedMovie) {
    appState.savedMovies = [...appState.savedMovies, savedMovie];
  }

  Future<Movie> getMovie(int id) async {
    return getSavedMovie(id)?.movie ?? api.getMovie(id);
  }

  Future<SearchResult> searchMovie(String query) {
    return api.searchMovie(query);
  }
}
