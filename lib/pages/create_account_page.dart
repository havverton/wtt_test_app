import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/utils/strings.dart';
import 'package:wtt_test_app/utils/styles.dart';

import 'package:wtt_test_app/widgets/inputs/registration_inputs.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: (MediaQuery.of(context).viewInsets.bottom == 0) ? kPlaceholderHeightFull : kPlaceholderHeightShort,
            decoration: kMainPlaceholderDecoration,
            child: Center(
                child: (MediaQuery.of(context).viewInsets.bottom == 0)
                    ? Text(kPlaceholderRegistrationText,
                        style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,)
                    : Container()),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _phoneTextField(),
                      _passwordTextField(),
                      _passwordConfirmationTextField(),
                      _confirmButton(context)
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _phoneTextField() => RegistrationInput(
      inputType: RegistrationInputType.phone,
    );

Widget _passwordTextField() => RegistrationInput(
      inputType: RegistrationInputType.password,
    );

Widget _passwordConfirmationTextField() => RegistrationInput(
      inputType: RegistrationInputType.confirmPassword,
    );

Widget _confirmButton(BuildContext context) => Center(
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: kRegistrationButtonColor,
            foregroundColor: kRegistrationButtonTextColor),
        onPressed: () => {},
        child: Center(
          child: Text(kRegistrationButtonText),
        ),
      ),
    );
