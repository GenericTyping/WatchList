import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:recase/recase.dart';
import 'package:rxdart/rxdart.dart';

// Typedefs
typedef FromJson<T> = T Function(Map<String, dynamic> json);
typedef FutureValueChanged<T> = FutureOr<void> Function(T value);
typedef ValueBuilder<T> = T Function();
typedef Mapper<T, R> = R Function(T value);

// Functions
Mapper<T, T> id<T>() => (value) => value;
Mapper<dynamic, T> castDynamic<T>() => (value) => value as T;

dynamic _convertKeysToTitleCase(dynamic source) {
  if (source is Map<String, dynamic>) {
    return source.map(
      (key, value) {
        return MapEntry(
          ReCase(key).camelCase,
          _convertKeysToTitleCase(value),
        );
      },
    );
  } else if (source is Iterable) {
    return source.map(_convertKeysToTitleCase).toList();
  } else {
    return source;
  }
}

// Classes
class Tuple<T1, T2> {
  const Tuple(this.first, this.second);

  final T1 first;
  final T2 second;
}

// Extensions
extension StringDynamicMapUtils on Map<String, dynamic> {
  Map<String, dynamic> toTitleCase() {
    return _convertKeysToTitleCase(this) as Map<String, dynamic>;
  }
}

extension NumUtils on num {
  int roundToNearest(int rounding) {
    return (this / rounding).round() * rounding;
  }

  String _getStringPadding({
    @required int amount,
    String paddingCharacter = '0',
  }) {
    final padAmount = amount - toString().length;
    return paddingCharacter * (padAmount < 0 ? 0 : padAmount);
  }

  String padLeft({
    @required int amount,
    String paddingCharacter = '0',
  }) {
    return _getStringPadding(amount: amount, paddingCharacter: paddingCharacter) + toString();
  }

  String padRight({
    @required int amount,
    String paddingCharacter = '0',
  }) {
    return toString() + _getStringPadding(amount: amount, paddingCharacter: paddingCharacter);
  }
}

extension IterableUtils<T> on Iterable<T> {
  Iterable<T> toTitleCase() {
    return _convertKeysToTitleCase(this) as Iterable<T>;
  }

  T get firstOrNull => isEmpty ? null : first;

  Stream<void> asyncForEach(Future<void> Function(T element) f) async* {
    for (final element in this) {
      yield f(element);
    }
  }

  Stream<R> asyncMap<R>(FutureOr<R> Function(T element) convert) async* {
    for (final element in this) {
      yield await convert(element);
    }
  }

  T get random {
    return (List<T>.from(this)..shuffle()).first;
  }

  Iterable<T> safeWhere(bool Function(T element) test) {
    try {
      return where(test);
      // ignore: avoid_catching_errors
    } on StateError {
      return <T>[];
    }
  }

  Iterable<T> intersperse(T element) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield element;
        yield iterator.current;
      }
    }
  }
}

extension ListUtils<T> on List<T> {
  T elementOrNullAt(int index) {
    if (asMap().containsKey(index)) {
      return elementAt(index);
    }

    return null;
  }
}

extension ListenableUtils on Listenable {
  Future<void> waitForValue() {
    final completer = Completer<void>();
    addListener(completer.complete);
    return completer.future;
  }
}

extension StreamUtils<T> on Stream<T> {
  Future<T> get firstNonNull => where((value) => value != null).single;

  ValueStream<T> toValueStream() {
    StreamSubscription subscription;
    final behaviorSubject = BehaviorSubject<T>(onCancel: subscription.cancel);
    subscription = listen(behaviorSubject.add);
    return behaviorSubject;
  }
}

extension ListBehaviorSubjectUtils<T> on BehaviorSubject<KtList<T>> {
  void addToList(T element) => add(value.plusElement(element));
  void removeFromList(T element) => add(value.minusElement(element));
  void removeFromListAtIndex(int index) => add(value.filterIndexed((i, _) => i != index));
}
