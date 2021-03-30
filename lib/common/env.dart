import 'package:flutter_app/common/constants.dart';

class Env {
  final String baseUrl;

  Env(this.baseUrl);
}

mixin EnvValue {
  static final Env development = Env(baseDevUrl);
  static final Env staging = Env(baseStagingUrl);
  static final Env production = Env(baseProUrl);
}