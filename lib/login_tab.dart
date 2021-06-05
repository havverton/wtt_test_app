import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wtt_test_app/main.dart';
import 'package:wtt_test_app/widgets/custom_divider.dart';
import 'package:wtt_test_app/widgets/email_button.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/widgets/login_button_column.dart';
import 'package:wtt_test_app/widgets/login_email_fields_widget.dart';

class LoginTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(flex: 4, child: LoginButtonColumn("Log in")),
          Flexible(flex: 1, child: CustomDividerWidget()),
          Flexible(flex: 3, child: Center(child: LoginEmailFieldsWidget())),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Center(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Forgot your password? "),
                      Text(
                        "Click here",
                        style: TextStyle(color: Colors.orange),
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

