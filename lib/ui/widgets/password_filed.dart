import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/constants.dart';

class PasswordTextFiled extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String errorText;
  final String labelText;
  final TextInputAction textInputAction;
  final FocusNode focusNode;

  const PasswordTextFiled(
      {Key key,
      this.onChanged,
      @required this.errorText,
      @required this.labelText,
      @required this.textInputAction,
      @required this.focusNode})
      : super(key: key);

  @override
  _PasswordTextFiledState createState() => _PasswordTextFiledState();
}

class _PasswordTextFiledState extends State<PasswordTextFiled> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: outlineInputBorder(),
          contentPadding:
              const EdgeInsets.only(left: 28.0, bottom: 18.0, top: 15.0),
          errorText: widget.errorText,
          suffixIcon: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
              iconSize: 18.0,
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              }),
          labelText: widget.labelText,
          prefixIcon: Padding(
              padding: EdgeInsetsDirectional.only(end: 8.0),
              child: Icon(Icons.lock))
      ),
      keyboardType: TextInputType.text,
      maxLines: 1,
      style: TextStyle(fontSize: 16.0),
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
    );
  }
}
