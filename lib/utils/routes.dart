import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ui/home/home.dart';
import 'package:flutter_app/ui/sign_in/sign_in.dart';

class Routes {
  Routes._();

  static const String login = '/login';
  static const String home = '/home';
  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => SignIn(),
    home: (BuildContext context) => Home()
  };
}