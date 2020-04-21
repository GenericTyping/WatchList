import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';
import 'package:watchlist/backend/api/api.dart';
import 'package:watchlist/backend/app_state_store.dart';
import 'package:watchlist/backend/models/models.dart';
import 'package:watchlist/backend/repositories/repository.dart';
import 'package:watchlist/utils/utils.dart';

class MovieRepository extends Repository {
  MovieRepository(Api api, this.appState) : super(api);

  final AppStateStore appState;

  ValueStream<KtList<SavedMovie>> get savedMovies => appState.savedMovies;

  SavedMovie getSavedMovie(int id) {
    return savedMovies.value.find((savedMovie) => savedMovie.movie.id == id);
  }

  void addSavedMovie(SavedMovie savedMovie) {
    appState.savedMovies.addToList(savedMovie);
  }

  Future<Movie> getMovie(int id) async {
    return getSavedMovie(id)?.movie ?? api.getMovie(id);
  }

  Future<SearchResult> searchMovie(String query) {
    return api.searchMovie(query);
  }
}
