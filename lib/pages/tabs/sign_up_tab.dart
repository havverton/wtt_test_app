import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/utils/strings.dart';
import 'package:wtt_test_app/utils/styles.dart';
import 'package:wtt_test_app/widgets/buttons/email_button.dart';
import 'package:wtt_test_app/widgets/custom_divider.dart';
import 'package:wtt_test_app/widgets/service_actions.dart';

class SignUpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(flex: 4, child: ServiceActionsWidget(AuthActions.SignUp)),
          Flexible(flex: 1, child: CustomDividerWidget()),
          Flexible(flex: 2, child: EmailButtonWidget()),
          _footerButton(context)
        ],
      ),
    );
  }

  Widget _footerButton(BuildContext context) {
    return Align(
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
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: kFooterButtonColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
