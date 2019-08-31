import 'package:recase/recase.dart';

// Typedefs
typedef FromJson<T> = T Function(Map<String, dynamic> json);

// Functions
dynamic convertKeysToTitleCase(dynamic source) {
  if (source is Map<String, dynamic>) {
    return source.map(
      (key, value) {
        return MapEntry(
          ReCase(key).camelCase,
          convertKeysToTitleCase(value),
        );
      },
    );
  } else if (source is List) {
    return source.map(convertKeysToTitleCase).toList();
  } else {
    return source;
  }
}
