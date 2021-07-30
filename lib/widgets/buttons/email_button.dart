import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/colors.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/styles.dart';

class EmailButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMediumButtonHeight,
      decoration: BoxDecoration(
        borderRadius: kMediumButtonBorderRadius,
        color: kSignUpButtonColor,
      ),
      child: InkWell(
          onTap: () => {print('lolKek')},
          borderRadius: kMediumButtonBorderRadius,
          child: Row(
            children: [
              Container(
                  margin: kMediumButtonLeftMargin,
                  child: Icon(
                    Icons.alternate_email,
                    size: 22.sp,
                  )),
              Expanded(
                child: Ink(
                  child: Container(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, kRegistrationRouteName),
                      child: Center(
                        child: Text(
                          kSignUpEmailButtonText,
                          style: kSignUpEmailButtonTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
