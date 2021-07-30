import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/widgets/buttons/email_login_button.dart';
import 'package:wtt_test_app/widgets/inputs/login_email_input.dart';

class LoginEmailFieldsWidget extends StatefulWidget {
  @override
  _LoginEmailFieldsWidgetState createState() => _LoginEmailFieldsWidgetState();
}

class _LoginEmailFieldsWidgetState extends State<LoginEmailFieldsWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Form(
            key: _formKey,
            child:
            Column(children: [
              LoginInputForm(inputType: LoginInputFormType.Email),
              Divider(height: 1.h),
              LoginInputForm(inputType: LoginInputFormType.Password),
            ]),
          ),
          EmailLoginButton()
        ],
      ),
    );
  }
}

String? validatePassword(String value) {
  if (!(value.length > 5) && value.isNotEmpty) {
    return "Password should contain more than 5 characters";
  }
  return null;
}
