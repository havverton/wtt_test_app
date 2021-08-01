import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/utils/strings.dart';
import 'package:wtt_test_app/utils/styles.dart';

class EmailButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: Theme.of(context)
            .elevatedButtonTheme
            .style!
            .copyWith(backgroundColor: kEmailSignupButtonColor),
        onPressed: () => Navigator.pushNamed(context, kRegistrationRouteName),
        child: InkWell(
          borderRadius: kMediumButtonBorderRadius,
          child: Row(children: [
            Container(
                margin: kMediumButtonLeftMargin,
                child: Icon(
                  Icons.alternate_email,
                  size: 22.sp,
                )),
            Expanded(
              child: Center(
                child: Text(kSignUpEmailButtonText),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
