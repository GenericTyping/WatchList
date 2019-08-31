import 'package:state_persistence/state_persistence.dart';
import 'package:watchlist/backend/stores/store.dart';

class AppStateStore extends Store {
  AppStateStore._(this._data) : super(_data);

  static const _kStorage = JsonFileStorage(filename: 'watch_list_app_state_store.json');
  static const _kSaveTimeout = Duration(milliseconds: 500);

  static Future<AppStateStore> init() async {
    final data = await PersistedData.load(_kStorage, _kSaveTimeout);
  }

  final PersistedData _data;

  // TODO: Add store getters.

}
