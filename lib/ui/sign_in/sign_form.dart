import 'package:flutter/material.dart';
import 'file:///C:/Users/duong/AndroidStudioProjects/flutter_app/lib/blocs/sign_in_bloc/bloc.dart';
import 'file:///C:/Users/duong/AndroidStudioProjects/flutter_app/lib/blocs/sign_in_bloc/provider.dart';
import 'package:flutter_app/common/keyboard.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/password_filed.dart';
import 'package:flutter_app/utils/routes.dart';

import '../../common/constants.dart';
import '../../common/size_config.dart';
class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final SignInBloc _signInBloc = SignInBloc();

  @override
  Widget build(BuildContext context) {
    return SignInProvider(
      bloc: _signInBloc,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(20)),
              emailField(),
              SizedBox(height: getProportionateScreenWidth(20)),
              passwordField(),
              SizedBox(height: getProportionateScreenWidth(20)),
              submitButton()
            ],
          ),
        ),
      ),
    );
  }

  emailField() {
    return StreamBuilder(
        stream: _signInBloc.validatedEmail,
        builder: (context, snapshot) {
          return TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: _signInBloc.changeEmail,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 28.0, bottom: 18.0, top: 15.0),
              border: outlineInputBorder(),
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: Padding(
                padding: EdgeInsetsDirectional.only(end: 5.0),
                child: Icon(Icons.email),
              ),
              errorText: snapshot.error,
            ),
          );
        });
  }

  passwordField() {
    return StreamBuilder(
        stream: _signInBloc.validatedPassword,
        builder: (context, snapshot) {
          return PasswordFiled(
            errorText: snapshot.error,
            onChanged: _signInBloc.changePassword,
          );
        });
  }

  submitButton() {
    return StreamBuilder(
        stream: _signInBloc.submitValid,
        builder: (context, snapshot) {
          return Button(
              text: "Continue",
              press: () {
                if(snapshot.data || snapshot.data == null) {
                  navigate();
                }
                KeyboardUtil.hideKeyboard(context);
              });
        });
  }

  navigate() async {
    User user = _signInBloc.submit();
    if (user != null) {
      Navigator.pushNamed(context, Routes.home);
    }
  }
}
