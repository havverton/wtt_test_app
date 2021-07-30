import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/styles.dart';
import 'package:wtt_test_app/widgets/buttons/registration_button.dart';
import 'package:wtt_test_app/widgets/inputs/registration_inputs.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              flex: MediaQuery.of(context).viewInsets.bottom == 0 ? 4 : 1,
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                height: 39.h,
                decoration: kMainPlaceholderDecoration,
                child: Stack(children: [
                  Center(
                      child: (MediaQuery.of(context).viewInsets.bottom == 0)
                          ? Text(kPlaceholderRegistrationText,
                              style: kPlaceHolderRegistrationStyle)
                          : Container()),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(),
                  )
                ]),
              ),
            ),
            Expanded(
              flex: 6,
              child: Form(
                key: _formKey,
                child: Container(
                    color: Colors.transparent,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                    child: Column(children: [
                      Flexible(
                        flex: 4,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RegistrationInput(
                                  inputType: RegistrationInputType.phone),
                              RegistrationInput(
                                  inputType: RegistrationInputType.password),
                              RegistrationInput(
                                  inputType:
                                      RegistrationInputType.confirmPassword),
                            ]),
                      ),
                      Flexible(
                          flex: 2,
                          child: Center(
                            child: const RegistrationPageButton(),
                          ))
                    ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
