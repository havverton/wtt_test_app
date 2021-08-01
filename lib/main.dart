import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/pages/create_account_page.dart';
import 'package:wtt_test_app/pages/login_page.dart';
import 'package:wtt_test_app/pages/welcome_page.dart';
import 'package:wtt_test_app/utils/strings.dart';
import 'package:wtt_test_app/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: basicTheme(),
        initialRoute: kInitPageRouteName,
        routes: {
          kInitPageRouteName: (context) => LoginPage(),
          kRegistrationRouteName: (context) => RegistrationPage(),
          "/welcome": (context) => WelcomePage()
        },
      );
    });
  }
}
