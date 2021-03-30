import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/constants.dart';

class PasswordFiled extends StatefulWidget {
  final String errorText;
  final ValueChanged<String> onChanged;
  const PasswordFiled({Key key, this.errorText, this.onChanged}) : super(key: key);

  @override
  _PasswordFiledState createState() => _PasswordFiledState();
}

class _PasswordFiledState extends State<PasswordFiled> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: _obscureText,
        onChanged: widget.onChanged,
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
          errorText: widget.errorText
        )
    );
  }
}