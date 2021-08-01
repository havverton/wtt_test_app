import 'package:flutter/material.dart';
import 'package:wtt_test_app/utils/strings.dart';
import 'package:wtt_test_app/utils/styles.dart';

class CustomDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            Expanded(child: Divider()),
            Container(
              margin: kDividerSpacing,
              child: Center(
                child: Text(
                  kDividerText,
                  style: kDividerTextStyle,
                ),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
      ),
    );
  }
}
