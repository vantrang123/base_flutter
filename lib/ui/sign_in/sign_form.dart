import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/password_filed.dart';

import '../../common/constants.dart';
import '../../common/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenWidth(20)),
                buildEmailFormField(),
                SizedBox(height: getProportionateScreenWidth(20)),
                buildPasswordFormField()
              ],
            ),
          ),
        ));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
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
          )),
    );
  }

  Widget buildPasswordFormField() {
    bool _obscureText = true;
    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
              iconSize: 18.0,
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              }),
          prefixIcon: Padding(
              padding: EdgeInsetsDirectional.only(end: 5.0),
              child: Icon(Icons.lock)),
          contentPadding:
              const EdgeInsets.only(left: 28.0, bottom: 18.0, top: 15.0),
          border: outlineInputBorder(),
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ));
  }
}
