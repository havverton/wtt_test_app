import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/pages/welcome_page.dart';
import 'package:wtt_test_app/styles.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              flex: MediaQuery.of(context).viewInsets.bottom == 0 ? 4 : 1,
              child: Container(
                height: 39.h,
                decoration: kMainPlaceholderDecoration,
                child: Stack(children: [
                  Center(
                      child: Text(
                    "Time to set up your account!",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).viewInsets.bottom == 0
                            ? 6.h
                            : 0),
                  )),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(),
                  )
                ]),
              ),
            ),
            Expanded(
              flex: 6,
              child: Form(
                key: _formKey,
                child: Container(
                    color: Colors.transparent,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                    child: Column(children: [
                      Flexible(
                        flex: 4,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Stack(children: [
                                kFormDecoratedContainer,
                                TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    cursorColor: Colors.grey,
                                    cursorHeight: 16.sp,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Phone number",
                                      contentPadding: EdgeInsets.only(left: 5.w),
                                      hintStyle: kHintStyle,
                                      suffixIcon: Icon(
                                        Icons.phone,
                                        color: Color(0xFFB5B5B5),
                                      ),
                                      border: InputBorder.none,
                                    )),
                              ]),
                              Stack(children: [
                               kFormDecoratedContainer,
                                TextFormField(
                                    controller: _pass,
                                    cursorColor: Colors.grey,
                                    cursorHeight: 16.sp,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(fontSize: 14.sp),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Password cannot be empty";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      contentPadding: EdgeInsets.only(left: 5.w),
                                      hintStyle: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xFFB5B5B5)),
                                      suffixIcon: Icon(
                                        Icons.lock,
                                        color: Color(0xFFB5B5B5),
                                      ),
                                      border: InputBorder.none,
                                    )),
                              ]),
                              Stack(
                                children: [
                                  kFormDecoratedContainer,
                                  TextFormField(
                                      controller: _confirmPass,
                                      cursorColor: Colors.grey,
                                      cursorHeight: 16.sp,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: TextStyle(fontSize: 14.sp),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Password cannot be empty";
                                        }
                                        if (value != _pass.text) {
                                          return "Password not match";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Confirm password",
                                        contentPadding: EdgeInsets.only(left: 5.w),
                                        hintStyle: kHintStyle,
                                        suffixIcon: Icon(
                                          Icons.lock,
                                          color: Color(0xFFB5B5B5),
                                        ),
                                        border: InputBorder.none,

                                      )),
                                ],
                              )
                            ]),
                      ),
                      Flexible(
                        flex: 2,
                        child: Center(
                          child: Container(
                            height: 6.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33),
                              color: Colors.black,
                            ),
                            child: InkWell(
                                onTap: () => {
                                      if (_formKey.currentState!.validate())
                                        {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Container(
                                                      height: 30.w,
                                                      width: 30.w,
                                                      child: Center(
                                                          child:
                                                              CircularProgressIndicator())),
                                                );
                                              }),
                                          Future.delayed(Duration(seconds: 3))
                                              .then((value) => {
                                                    Navigator.of(context).pop(),
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              WelcomePage()),
                                                    )
                                                  })
                                        }
                                    },
                                child: Ink(
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        "NEXT",
                                        style: TextStyle(
                                            color: Color(0xFFFA1BBF),
                                            fontSize: 13.sp),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      )
                    ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
