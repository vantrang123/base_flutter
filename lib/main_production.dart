import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'app/app.dart';
import 'common/env.dart';

void main() {
  runZonedGuarded(() {
    runApp(App(env: EnvValue.staging));
  }, (error, stackTrace) async {});
}
