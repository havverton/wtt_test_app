import 'package:flutter/material.dart';
import 'package:wtt_test_app/widgets/buttons/service_button.dart';

class LoginButtonColumn extends StatelessWidget {
  final String actionType;

  LoginButtonColumn(this.actionType);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ServiceButton(
                service: LoginService.facebook, actionType: actionType),
            ServiceButton(service: LoginService.google, actionType: actionType),
            ServiceButton(
                service: LoginService.instagram, actionType: actionType)
          ],
        ),
      ),
    );
  }
}
