import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/utils/colors.dart';
import 'package:wtt_test_app/utils/styles.dart';

ThemeData basicTheme() => ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF552222),
    scaffoldBackgroundColor: kBackgroundColor,
    dividerTheme: DividerThemeData(
      color: kDividerColor,
      thickness: kDividerThickness,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fixedSize: MaterialStateProperty.all<Size>(
            Size(double.infinity, kMediumButtonHeight)),
        textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(fontSize: kButtonFontSize, fontFamily: kMainFontName)),
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 1.5.h)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: kMediumButtonBorderRadius)),
      ),
    ),
    buttonTheme: ButtonThemeData(
        height: kMediumButtonHeight,
        buttonColor: Colors.purple,
        textTheme: ButtonTextTheme.primary),
    hintColor: kFormHintColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kCursorColor,
    ),
    indicatorColor: kSelectedLabelColor,
    disabledColor: kUnselectedLabelColor,
    inputDecorationTheme: InputDecorationTheme(
        fillColor: kInputFillColor,
        filled: true,
        focusColor: Colors.black,
        isDense: true,
        border: OutlineInputBorder(borderRadius: kInputBorderRadius),
        enabledBorder: kInputBorderStyle,
        focusedBorder: kInputBorderStyle,
        prefixStyle: TextStyle(color: kInputFillColor)),
    primaryIconTheme: IconThemeData(color: Color(0xFF808080)),
    textTheme: TextTheme(
        bodyText2: TextStyle(color: Colors.black),
        headline1: TextStyle(
            color: Colors.white, fontSize: 40.sp, fontWeight: FontWeight.w900),
        headline2: TextStyle(color: Colors.white, fontSize: 25.sp),
        headline4: TextStyle(color: Colors.white, fontSize: 17.sp)));
