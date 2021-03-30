import 'dart:async';

import 'package:flutter_app/common/constants.dart';

class Validator {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (emailValidatorRegExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Enter valid email');
    }
  });

  final validatePassword =
      StreamTransformer<String, String>.fromHandlers(
        handleData: (password, sink) {
          if (password.length >= 6) {
            sink.add(password);
          } else {
            sink.addError('Password word must be greater 6');
          }
        }
      );
}