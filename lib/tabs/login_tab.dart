import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/styles.dart';
import 'package:wtt_test_app/widgets/custom_divider.dart';
import 'package:wtt_test_app/widgets/login_by_email_form.dart';
import 'package:wtt_test_app/widgets/service_actions.dart';

class LoginTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(flex: 4, child: ServiceActionsWidget(AuthActions.LogIn)),
          Flexible(flex: 1, child: CustomDividerWidget()),
          Flexible(flex: 4, child: Center(child: LoginEmailFieldsWidget())),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(kLoginPageFooterText),
                      Text(
                        kLoginPageFooterButtonText,
                        style: kLoginFooterButtonTextStyle,
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
