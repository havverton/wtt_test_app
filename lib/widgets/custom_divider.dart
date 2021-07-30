import 'package:flutter/material.dart';
import 'package:wtt_test_app/colors.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/styles.dart';

class CustomDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Divider(
                  thickness: kDividerThickness,
                  color: kDividerColor,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  kDividerText,
                  style: kDividerTextStyle,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Divider(
                  thickness: kDividerThickness,
                  color: kDividerColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
