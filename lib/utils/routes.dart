import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ui/sign_in/sign_in.dart';

class Routes {
  Routes._();

  static const String login = '/login';
  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => SignIn()
  };
}