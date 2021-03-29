import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/env.dart';

import 'app/app.dart';

void main() {
  runZonedGuarded(() {
    runApp(App(env: EnvValue.staging));
  }, (error, stackTrace) async {});
}