import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

final kMainMaterialTheme = ThemeData(fontFamily: "Monserrat");
const kUnselectedLabelColor = Color(0x77FFFFFF);
const kSelectedLabelColor = Color(0xFFFFFFFF);
final kLoginServiceButtonTextStyle = TextStyle(color: Colors.white, fontSize: 13.sp);
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
final kMainBorderRadius = BorderRadius.circular(33);
final kTabsTextStyle = TextStyle(fontSize: 15.sp);

final kFormDecoratedContainer = Container(
  height: 5.h,
  decoration: BoxDecoration(
      color: Color(0xFFEBEBEB),
      borderRadius:
      BorderRadius.circular(30)),
);