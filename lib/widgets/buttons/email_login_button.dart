import 'package:flutter/material.dart';
import 'package:wtt_test_app/colors.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/styles.dart';

class EmailLoginButton extends StatelessWidget {
  const EmailLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: kMediumButtonHeight,
        decoration: BoxDecoration(
            borderRadius: kMediumButtonBorderRadius,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kLoginEmailButtonStartColor,
                  kLoginEmailButtonEndColor
                ])),
        child: InkWell(
            borderRadius: kMediumButtonBorderRadius,
            onTap: () => {
                  /* //TODO прикрутить блок для проверки
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
                }*/
                },
            child: Container(
              child: Center(
                child: Text(
                  kLoginEmailButtonText,
                  style: kLoginButtonTextStyle,
                ),
              ),
            )),
      ),
    );
  }
}
