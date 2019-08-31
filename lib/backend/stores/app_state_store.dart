import 'package:state_persistence/state_persistence.dart';
import 'package:watchlist/backend/api/mock/mock_saved_movies.dart';
import 'package:watchlist/backend/models/models.dart';
import 'package:watchlist/backend/stores/store.dart';

class AppStateStore extends Store {
  AppStateStore._(this._data) : super(_data);

  static const _kStorage = JsonFileStorage(filename: 'watch_list_app_state_store.json');
  static const _kSaveTimeout = Duration(milliseconds: 500);

  static const _kSavedMoviesKey = 'savedMovies';

  static Future<AppStateStore> init() async {
    final data = await PersistedData.load(_kStorage, _kSaveTimeout);
    return AppStateStore._(data);
  }

  final PersistedData _data;

  Iterable<SavedMovie> get savedMovies {
    final List data = _data[_kSavedMoviesKey];

    if (data == null) {
      // return [];
      return mockSavedMovies;
    }

    return data.map((json) => SavedMovie.fromJson(json));
  }
  set savedMovies(List<SavedMovie> value) {
    assert(value != null, 'Value cannot be null.');

    _data[_kSavedMoviesKey] = value.map((movie) => movie.toJson()).toList();
  }

  // TODO: Add store getters.

}
