import 'file:///C:/Users/duong/AndroidStudioProjects/flutter_app/lib/blocs/sign_in_bloc/validator.dart';
import 'package:flutter_app/models/user.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc extends Object with Validator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // sending data to bloc
  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  // receiving data from bloc
  Stream<String> get validatedEmail =>
      _emailController.stream.transform(validateEmail);

  Stream<String> get validatedPassword =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(validatedEmail, validatedPassword, (e, p) => true);

  User submit() => User(
      _emailController.value.toString(), _passwordController.value.toString());

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
