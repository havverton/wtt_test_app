import 'package:flutter/material.dart';
import 'package:wtt_test_app/utils/strings.dart';
import 'package:wtt_test_app/widgets/buttons/service_button.dart';

enum AuthActions { SignUp, LogIn }

extension AuthActionsExtension on AuthActions {
  String get name {
    if (this == AuthActions.SignUp) {
      return kSignUpTabText;
    } else {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _facebookServiceButton(),
          _googleServiceButton(),
          _instagramServiceButton()
        ],
      ),
    );
  }

  Widget _facebookServiceButton() =>
      ServiceButton(service: LoginService.facebook, actionType: action.name);

  Widget _googleServiceButton() =>
      ServiceButton(service: LoginService.google, actionType: action.name);

  Widget _instagramServiceButton() =>
      ServiceButton(service: LoginService.instagram, actionType: action.name);
}
