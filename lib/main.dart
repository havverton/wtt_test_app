import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/pages/create_account_page.dart';
import 'package:wtt_test_app/pages/login_page.dart';
import 'package:wtt_test_app/pages/welcome_page.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/styles.dart';

void main() {
  runApp(MyApp());
  //TODO Сделать Theme
  //TODO Все виджеты const
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: kMainMaterialTheme,
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
