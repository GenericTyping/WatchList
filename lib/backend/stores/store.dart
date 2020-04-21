// import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
import 'package:state_persistence/state_persistence.dart';

export 'app_state_store.dart';

class Store {
  Store(this._data);

  final PersistedData _data;

  bool get isEmpty => _data.isEmpty;

  bool get isNotEmpty => !isEmpty;

  void clear() {
    _data.clear();
  }
}
