import 'package:flutter/material.dart';
import 'package:flutter_app/common/keyboard.dart';
import 'package:flutter_app/common/size_config.dart';
import 'package:flutter_app/ui/base/button.dart';

import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(30)),
            SignForm(),
            SizedBox(height: getProportionateScreenHeight(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15)),
              child: Button(
                text: "Continue",
                press: () {
                  KeyboardUtil.hideKeyboard(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
