import 'package:flutter/material.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/styles.dart';

class RegistrationPageButton extends StatelessWidget {
  const RegistrationPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMediumButtonHeight,
      decoration: kRegistrationButtonStyle,
      child: InkWell(
        onTap: () => {/*
                                      if (_formKey.currentState!.validate())
                                        {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Container(
                                                      height: 30.w,
                                                      width: 30.w,
                                                      child: Center(
                                                          child:
                                                              CircularProgressIndicator())),
                                                );
                                              }),
                                          Future.delayed(Duration(seconds: 3))
                                              .then((value) => {
                                                    Navigator.of(context).pop(),
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              WelcomePage()),
                                                    )
                                                  })
                                        }
                                    */},
        child: Ink(
            child: Container(
              child: Center(
                child: Text(
                    kRegistrationButtonText,
                    style: kRegistrationButtonTextStyle
                ),
              ),
            )),
      ),
    );
  }
}
