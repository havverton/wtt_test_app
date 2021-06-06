import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/widgets/custom_divider.dart';
import 'package:wtt_test_app/widgets/email_button.dart';
import 'package:wtt_test_app/widgets/login_by_service_column.dart';

class SignUpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(flex: 4, child: LoginButtonColumn("Sign up")),
          Flexible(flex: 1, child: CustomDividerWidget()),
          Flexible(flex: 3, child: EmailButtonWidget()),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text("Already have an account?"),
                      InkWell(
                        onTap: () => {print('Я нажалась :)')},
                        child: Text(
                          "Click here",
                          style: TextStyle(color: Colors.orange),
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
