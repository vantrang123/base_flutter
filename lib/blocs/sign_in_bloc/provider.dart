import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/duong/AndroidStudioProjects/flutter_app/lib/blocs/sign_in_bloc/bloc.dart';

class SignInProvider extends InheritedWidget {
  final SignInBloc bloc;

  SignInProvider({Key key, Widget child, @required this.bloc}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static SignInBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SignInProvider>().bloc;
  }
}