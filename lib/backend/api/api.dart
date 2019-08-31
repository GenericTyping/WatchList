import 'dart:async';

class ApiEnv {
  const ApiEnv._();

  static const live = ApiEnv._();
}

abstract class Api {
  const Api(this.env);

  final ApiEnv env;

  // TODO: Add calls
}