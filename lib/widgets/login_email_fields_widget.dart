import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/welcome_page.dart';

class LoginEmailFieldsWidget extends StatefulWidget {
  @override
  _LoginEmailFieldsWidgetState createState() => _LoginEmailFieldsWidgetState();
}

class _LoginEmailFieldsWidgetState extends State<LoginEmailFieldsWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      //  color: Colors.red,
      child: Form(
        key: _formKey,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            height: 5.h,
            decoration: BoxDecoration(
                color: Color(0xFFEBEBEB),
                borderRadius: BorderRadius.circular(30)),
            child: TextField(
                cursorColor: Colors.grey,
                cursorHeight: 16.sp,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
                decoration: InputDecoration(
                  fillColor: Color(0xFFEBEBEB),
                  hintText: "Email",
                  hintStyle:
                      TextStyle(fontSize: 14.sp, color: Color(0xFFB5B5B5)),
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: Color(0xFFB5B5B5),
                  ),
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  prefixStyle: TextStyle(
                    color: Color(0xFFEBEBEB),
                  ),
                  focusColor: Color(0xFFEBEBEB),
                )),
          ),
          Stack(
            children: [
              Container(
                height: 5.h,
                decoration: BoxDecoration(
                    color: Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.circular(30)),
              ),
              TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  cursorColor: Colors.grey,
                  cursorHeight: 16.sp,
                  textAlignVertical: TextAlignVertical.center,
                  validator: (text) => validatePassword(text ?? ""),
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                  decoration: InputDecoration(
                    fillColor: Color(0xFFEBEBEB),
                    hintText: "Password",
                    hintStyle:
                        TextStyle(fontSize: 14.sp, color: Color(0xFFB5B5B5)),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFFB5B5B5),
                    ),
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    prefixStyle: TextStyle(
                      color: Color(0xFFEBEBEB),
                    ),
                    focusColor: Color(0xFFEBEBEB),
                  )),
            ],
          ),
          Container(
            height: 6.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFFA450), Color(0xFFE16C00)])),
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
                                          child: CircularProgressIndicator())),
                                );
                              }),
                          Future.delayed(Duration(seconds: 3))
                              .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WelcomePage()),
                                  ))
                        }
                    },
                child: Container(
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )),
          ),
        ]),
      ),
    );
  }
}

String? validatePassword(String value) {
  if (!(value.length > 5) && value.isNotEmpty) {
    return "Password should contain more than 5 characters";
  }
  return null;
}
