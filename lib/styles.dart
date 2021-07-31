import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/colors.dart';

final kMainMaterialTheme = ThemeData(fontFamily: "Monserrat");

final kLoginServiceButtonTextStyle =
    TextStyle(color: Colors.white, fontSize: 13.sp);
final kHintStyle = TextStyle(fontSize: 14.sp, color: Color(0xFFB5B5B5));
const kMainPlaceholderDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color(0x40000000),
        spreadRadius: 0,
        blurRadius: 15,
        offset: Offset(0, 4),
      ),
    ],
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFF820F), Color(0xFFFB31FF)]));
final kLoginPagePlaceholderHeight = 39.h;

final kTabsTextStyle = TextStyle(fontSize: 15.sp);

final kInputDecoration = BoxDecoration(
    color: Color(0xFFEBEBEB), borderRadius: BorderRadius.circular(30));

final kPlaceHolderRegistrationStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 6.h);

// /tabs styles
final kSignUpFooterButtonTextStyle = TextStyle(color: Colors.orange);
final kLoginFooterButtonTextStyle = TextStyle(color: Colors.orange);

// /widgets styles
final kDividerTextStyle = TextStyle(color: kDividerColor, fontSize: 17.sp);
final kDividerThickness = 5.0;

// button styles
final kMediumButtonHeight = 6.h;
final kMediumButtonBorderRadius = BorderRadius.circular(33);
final kMediumButtonLeftMargin = EdgeInsets.only(left: 3.w);
final kServiceButtonDecoration = BoxDecoration(
    borderRadius: kMediumButtonBorderRadius, color: kServiceButtonColor);
final kServiceButtonIconWidth = 4.h;
final kServiceButtonIconHeight = 4.h;
final kRegistrationButtonStyle = BoxDecoration(
  borderRadius: kMediumButtonBorderRadius,
  color: kRegistrationButtonColor,
);
final kRegistrationButtonTextStyle =
    TextStyle(color: kRegistrationButtonTextColor, fontSize: 14.sp);

final kLoginPageButtonStyle = BoxDecoration(
    borderRadius: kMediumButtonBorderRadius,
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          kLoginEmailButtonStartColor,
          kLoginEmailButtonEndColor
        ]));

// input styles
final kInputHeight = 5.h;
final kInputBorderRadius = BorderRadius.circular(33);
final kInputBorderStyle = OutlineInputBorder(
    borderRadius: kInputBorderRadius,
    borderSide: BorderSide(color: kInputBorderColor));
final kInputErrorBorderStyle = OutlineInputBorder(
    borderRadius: kInputBorderRadius,
    borderSide: BorderSide(color: kInputErrorBorderColor));

kLoginInputStyle(String hintText, Icon icon) => InputDecoration(
    fillColor: kInputFillColor,
    filled: true,
    contentPadding: EdgeInsets.symmetric(vertical: 0.5.h),
    hintText: hintText,
    hintStyle: kHintStyle,
    prefixIcon: icon,
    focusColor: Colors.green,
    border: OutlineInputBorder(borderRadius: kInputBorderRadius),
    enabledBorder: kInputBorderStyle,
    focusedBorder: kInputBorderStyle,
    prefixStyle: TextStyle(color: kInputFillColor));


kRegistrationInputStyle(String hintText, Icon icon) =>
    InputDecoration(
      fillColor: kInputFillColor,
      filled: true,
      hintText: hintText,
      hintStyle: kHintStyle,
      contentPadding: EdgeInsets.only(left: 5.w),
      suffixIcon: icon,
      border: kInputBorderStyle,
      enabledBorder: kInputBorderStyle,
      focusedBorder: kInputBorderStyle,
      disabledBorder: kInputBorderStyle,
      suffixStyle: TextStyle(color: kInputFillColor)
    );


final kSignUpEmailButtonTextStyle =
    TextStyle(color: kButtonTextColor, fontSize: 14.sp);
final kLoginButtonTextStyle = TextStyle(color: Colors.white, fontSize: 14.sp);
