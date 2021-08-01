import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/utils/colors.dart';

final kMainFontName = "Monserrat";
final kButtonFontSize = 14.sp;
final kFooterTextButtonFontSize = 10.sp;


// styles variables
final kServiceButtonColor = MaterialStateProperty.all<Color>(Colors.black);
final kEmailSignupButtonColor = MaterialStateProperty.all<Color>(Color(0xB6B6B6));
final kEmailLoginButtonColor = MaterialStateProperty.all<Color>(Colors.transparent);
final kEmailLoginButtonShadowColor = MaterialStateProperty.all<Color>(Colors.transparent);
final kFooterButtonColor = Colors.orange;
final kLoginTabContainerPaddings = EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h);
final kRegistrationButtonColor = MaterialStateProperty.all<Color>(Colors.black);
final kRegistrationButtonTextColor = MaterialStateProperty.all<Color>(Color(0xFFFA1BBF));
//
//banner
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
        colors: kPlaceholderGradientColors));
const kPlaceholderGradientColors = [Color(0xFFFF820F), Color(0xFFFB31FF)];
final kPlaceholderHeightFull = 35.h;
final kPlaceholderHeightShort = 10.h;




final kInputDecoration = BoxDecoration(
    color: Color(0xFFEBEBEB), borderRadius: BorderRadius.circular(30));


// /pages.tabs styles
final kTabsTextStyle = TextStyle(fontSize: 15.sp);

// /widgets styles
final kDividerTextStyle = TextStyle(color: kDividerColor, fontSize: 17.sp);
final kDividerThickness = 5.0;
final kDividerSpacing = EdgeInsets.symmetric(horizontal: 2.w);

// button styles
final kMediumButtonHeight = 6.h;
final kServiceButtonIconWidth = 4.h;
final kServiceButtonIconHeight = 4.h;

final kMediumButtonBorderRadius = BorderRadius.circular(33);
final kMediumButtonLeftMargin = EdgeInsets.only(left: 3.w);
final kServiceButtonDecoration = BoxDecoration(borderRadius: kMediumButtonBorderRadius);

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
final kInputContentPadding = EdgeInsets.symmetric(vertical: 0.5.h);
final kInputBorderStyle = OutlineInputBorder(
    borderRadius: kInputBorderRadius,
   borderSide: BorderSide(color: kInputBorderColor));


kLoginInputStyle(String hintText, Icon icon) => InputDecoration(
    fillColor: kInputFillColor,
    filled: true,
    contentPadding: EdgeInsets.symmetric(vertical: 0.5.h),
    hintText: hintText,
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
        contentPadding: EdgeInsets.only(left: 5.w),
        suffixIcon: icon,
        border: kInputBorderStyle,
        enabledBorder: kInputBorderStyle,
        focusedBorder: kInputBorderStyle,
        disabledBorder: kInputBorderStyle,
        suffixStyle: TextStyle(color: kInputFillColor)
    );
