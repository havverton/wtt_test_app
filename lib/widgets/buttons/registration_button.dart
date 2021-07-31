import 'package:flutter/material.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/styles.dart';

class RegistrationPageButton extends StatelessWidget {
  const RegistrationPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: Container(
        height: kMediumButtonHeight,
        decoration: kRegistrationButtonStyle,
        child: InkWell(
          onTap: () => {},
          child: Container(
              child: Center(
                child: Text(
                    kRegistrationButtonText,
                    style: kRegistrationButtonTextStyle
                ),
              ),
            ),
        ),
      ),
    );
  }
}
