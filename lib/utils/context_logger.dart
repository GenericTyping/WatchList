import 'dart:convert';

typedef Logger = void Function([Object arg]);

class ContextLogger {
  const ContextLogger(this.context);

  final String context;

  Logger Function(String methodName) get _log => (methodName) => ([arg]) {
        var message = arg?.toString();
        if (arg != null && !(arg is String)) {
          try {
            message = const JsonEncoder().convert(arg);
            // ignore: avoid_catching_errors
          } on JsonUnsupportedObjectError {
            // Do nothing.
          }
        }

        final baseText = '[${DateTime.now()}] $context: $methodName';
        final optionalMessageText = message == null ? '' : ' - $message';

        print('$baseText$optionalMessageText');
      };

  void call([String arg]) => _log('Log')(arg);

  Logger function(String functionName, [dynamic parameters]) {
    final scopedLogger = scope(functionName);

    if (parameters != null) {
      scopedLogger(parameters);
    }

    return scopedLogger;
  }

  Logger scope(String scope) => _log(scope);

  Logger get start => _log('Start');

  Logger get done => _log('Done');

  Logger get error => _log('Error');
}
