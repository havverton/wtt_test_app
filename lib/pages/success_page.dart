import 'package:flutter/material.dart';

class RegistrationArguments {
  final String number;
  final String password;

  RegistrationArguments(this.number, this.password);
}

class ExtractArguments extends StatelessWidget {
  const ExtractArguments({Key? key}) : super(key: key);

  static const routeName = '/success';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RegistrationArguments;
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Your address is: ${args.number}@google.com"),
        Text("Your password is: ${args.password}"),
      ],
    )));
  }
}
