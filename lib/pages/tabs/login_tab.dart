import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wtt_test_app/utils/strings.dart';
import 'package:wtt_test_app/utils/styles.dart';
import 'package:wtt_test_app/widgets/custom_divider.dart';
import 'package:wtt_test_app/widgets/login_by_email_form.dart';
import 'package:wtt_test_app/widgets/service_actions.dart';

class LoginTab extends StatelessWidget {
  final bool isKeyboardOpen;

  const LoginTab(this.isKeyboardOpen);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kLoginTabContainerPaddings,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (!isKeyboardOpen)
            Flexible(flex: 4, child: ServiceActionsWidget(AuthActions.LogIn)),
          if (!isKeyboardOpen) Flexible(flex: 1, child: CustomDividerWidget()),
          Flexible(flex: 4, child: Center(child: LoginEmailFieldsWidget())),
          _footerWidget(context)
        ],
      ),
    );
  }

  Widget _footerWidget(BuildContext context) => Align(
      alignment: Alignment.bottomCenter,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(kLoginPageFooterText),
            InkWell(
              onTap: () {},
              child: Text(kLoginPageFooterButtonText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: kFooterButtonColor)),
            )
          ],
        ),
      ));
}
