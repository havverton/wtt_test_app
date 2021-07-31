import 'package:flutter/material.dart';

enum LoginInputFormType{
  Email, Password
}

extension LoginInputHint on LoginInputFormType{
  String get hint{
    if(this == LoginInputFormType.Email){
      return "Email";
    }else{
      return "Password";
    }
  }

  Icon get icon{
    if(this == LoginInputFormType.Email){
      return Icon(Icons.alternate_email);
    }else{
      return Icon(Icons.lock);
    }
  }
}

