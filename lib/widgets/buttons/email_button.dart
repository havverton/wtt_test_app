import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/colors.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/styles.dart';

class EmailButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Ink(
      child: Container(
        height: kMediumButtonHeight,
        decoration: BoxDecoration(
          borderRadius: kMediumButtonBorderRadius,
          color: kSignUpButtonColor,
        ),
        child: InkWell(
          borderRadius: kMediumButtonBorderRadius,
          onTap: () =>
              Navigator.pushNamed(context, kRegistrationRouteName),
          child: Row(
              children: [
              Container(
              margin: kMediumButtonLeftMargin,
              child: Icon(
                Icons.alternate_email,
                size: 22.sp,
              )),
           Expanded(
             child: Center(
                child: Text(
                  kSignUpEmailButtonText,
                  style: kSignUpEmailButtonTextStyle,
                ),
              ),
           ),
          ]
        ),
      ),
    ),
        );
  }
}
