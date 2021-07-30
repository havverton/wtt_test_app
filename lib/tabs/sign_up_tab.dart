import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/styles.dart';
import 'package:wtt_test_app/widgets/buttons/email_button.dart';
import 'package:wtt_test_app/widgets/custom_divider.dart';
import 'package:wtt_test_app/widgets/login_by_service_column.dart';

class SignUpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(flex: 4, child: LoginButtonColumn(kSignUpTabText)),
          Flexible(flex: 1, child: CustomDividerWidget()),
          Flexible(flex: 3, child: EmailButtonWidget()),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text(kSignUpPageFooterText),
                      InkWell(
                        onTap: () => {},
                        child: Text(
                          kSignUpPageFooterButtonText,
                          style: kSignUpFooterButtonTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
