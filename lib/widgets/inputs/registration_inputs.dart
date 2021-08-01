import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/utils/styles.dart';

enum RegistrationInputType { phone, password, confirmPassword }

extension infoRegistrationInput on RegistrationInputType {
  String get hint {
    switch (this) {
      case RegistrationInputType.phone:
        return "Phone number";
      case RegistrationInputType.password:
        return "Password";
      case RegistrationInputType.confirmPassword:
        return "Confirm password";
    }
  }

  Icon get icon {
    switch (this) {
      case RegistrationInputType.phone:
        return Icon(Icons.phone);
      case RegistrationInputType.password:
        return Icon(Icons.lock);
      case RegistrationInputType.confirmPassword:
        return Icon(Icons.lock);
    }
  }
}

class RegistrationInput extends StatelessWidget {
  final RegistrationInputType inputType;

  const RegistrationInput({Key? key, required this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        inputFormatters: (inputType == RegistrationInputType.phone)
            ? [FilteringTextInputFormatter.digitsOnly] : [],
        cursorHeight: 16.sp,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 14.sp,
        ),
        decoration: kRegistrationInputStyle(inputType.hint, inputType.icon));
  }
}

