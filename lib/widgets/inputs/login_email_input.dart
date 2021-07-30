import 'package:flutter/material.dart';
import 'package:wtt_test_app/colors.dart';
import 'package:wtt_test_app/styles.dart';

enum LoginInputFormType{
  Email, Password
}

extension LoginInputHint on LoginInputFormType{
  String get hint{
    if(this == LoginInputFormType.Email){
      return "Email";
    }else{
      return "Password";
    }
  }

  Icon get icon{
    if(this == LoginInputFormType.Email){
      return Icon(Icons.alternate_email);
    }else{
      return Icon(Icons.lock);
    }
  }
}



class LoginInputForm extends StatelessWidget {
  final LoginInputFormType inputType;
  const LoginInputForm({Key? key, required this.inputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kInputHeight,
      child: TextFormField(
          cursorColor: kCursorColor,
          cursorHeight: kCursorHeight,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: kLoginInputStyle(inputType.hint, inputType.icon)
          )
    );
  }
}

