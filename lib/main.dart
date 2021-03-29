import 'dart:async';

import 'package:flutter/material.dart';

import 'app/app.dart';
import 'common/env.dart';

void main() {
  runZonedGuarded(() {
    runApp(App(env: EnvValue.development));
  }, (error, stackTrace) async {});
}
