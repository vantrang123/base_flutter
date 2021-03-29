import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/keyboard.dart';
import 'package:flutter_app/common/size_config.dart';
import 'package:flutter_app/ui/sign_in/body.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign In"),
      ),
      body: Scaffold(
        body: GestureDetector(
          onTap: () {
            KeyboardUtil.hideKeyboard(context);
          },
          child: Body(),
        ),
      ),
    );
  }
}
