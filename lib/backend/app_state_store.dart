import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:state_persistence/state_persistence.dart';
import 'package:watchlist/backend/models/models.dart';
import 'package:watchlist/utils/utils.dart';

class AppStateStore {
  AppStateStore._({
    @required this.savedMovies,
  }) : super();

  static const _kStorage = JsonFileStorage(filename: 'watch_list_app_state_store_2.json');
  static const _kSaveTimeout = Duration(milliseconds: 500);

  static const _kSavedMoviesKey = 'savedMovies';

  static Future<AppStateStore> init() async {
    final data = await PersistedData.load(_kStorage, _kSaveTimeout);
    final bsf = _StoreBehaviorSubjectFactory(data);

    return AppStateStore._(
      savedMovies: bsf.generateKtListForKey<SavedMovie>(
        _kSavedMoviesKey,
        defaultValue: KtList.empty(),
        fromJson: (json) => SavedMovie.fromJson(json),
      ),
    );
  }

  final BehaviorSubject<KtList<SavedMovie>> savedMovies;

  void dispose() {
    savedMovies.close();
  }
}

class _StoreBehaviorSubjectFactory {
  const _StoreBehaviorSubjectFactory(this._data);

  final PersistedData _data;

  BehaviorSubject<T> generateForKey<T>(
    String key, {
    T defaultValue,
    Mapper<dynamic, T> fromJson,
    Mapper<T, dynamic> toJson,
  }) {
    final valueFromStorage = _data[key];
    T initialValue;

    if (valueFromStorage == null) {
      initialValue = defaultValue;
    } else {
      initialValue = fromJson?.call(valueFromStorage) ?? valueFromStorage as T;
    }

    return BehaviorSubject<T>.seeded(initialValue)
      ..stream.listen((newValue) {
        _data[key] = toJson?.call(newValue) ?? newValue;
      });
  }

  BehaviorSubject<KtList<T>> generateKtListForKey<T>(
    String key, {
    KtList<T> defaultValue,
    Mapper<dynamic, T> fromJson,
    Mapper<T, dynamic> toJson,
  }) {
    return generateForKey<KtList<T>>(
      key,
      defaultValue: defaultValue,
      fromJson: (jsonList) {
        return KtList.from((jsonList as List).map(fromJson ?? castDynamic()));
      },
      toJson: (value) {
        return value.asList().map(toJson ?? id<T>()).toList();
      },
    );
  }
}
