import 'package:flutter/material.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/widgets/buttons/service_button.dart';

enum AuthActions{
  SignUp,LogIn
}

extension AuthActionsExtension on AuthActions{
  String get name {
      if(this == AuthActions.SignUp){
        return kSignUpTabText;
  }else{
        return kLoginTabText;
      }
  }
}

class ServiceActionsWidget extends StatelessWidget {
  final AuthActions action;

  ServiceActionsWidget(this.action);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ServiceButton(
                service: LoginService.facebook, actionType: action.name),
            ServiceButton(service: LoginService.google, actionType: action.name),
            ServiceButton(
                service: LoginService.instagram, actionType: action.name)
          ],
        ),
      ),
    );
  }
}
