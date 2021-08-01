import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtt_test_app/auth/bloc/form_submission_status.dart';
import 'package:wtt_test_app/auth/bloc/login/login_bloc.dart';
import 'package:wtt_test_app/auth/bloc/login/login_bloc_events.dart';
import 'package:wtt_test_app/auth/bloc/login/login_bloc_states.dart';
import 'package:wtt_test_app/auth/login_repository.dart';
import 'package:wtt_test_app/utils/colors.dart';
import 'package:wtt_test_app/utils/keys.dart';
import 'package:wtt_test_app/utils/strings.dart';
import 'package:wtt_test_app/utils/styles.dart';

class LoginEmailFieldsWidget extends StatefulWidget {
  @override
  _LoginEmailFieldsWidgetState createState() => _LoginEmailFieldsWidgetState();
}

class _LoginEmailFieldsWidgetState extends State<LoginEmailFieldsWidget> {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(context.read<AuthRepository>()),
      child: BlocListener<LoginBloc, LoginBlocState>(
    listener: (context,state){
      final formStatus = state.formStatus;
      if(formStatus is SubmissionFailed){
        _showSnackBar(context, formStatus.exception.toString());
    }
      if(formStatus is SubmissionSuccess){
        Navigator.popAndPushNamed(context, "/welcome");
      }
    },
        child: Container(
            child: Form(
              key: formEmailLoginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _emailInput(),
                _passwordInput(),
                _loginButton()
              ]),
            ),
          )
      ),
    );
  }

  Widget _emailInput() {
    return BlocBuilder<LoginBloc, LoginBlocState>(builder: (context, state) {
      final inputType = LoginInputFormType.Email;
      return Container(
          child: TextFormField(
              cursorHeight: kCursorHeight,
              textAlignVertical: TextAlignVertical.center,
              validator: (value) =>
              state.isValidEmail ? null : "Email is invalid",
              onChanged: (value) => context
                  .read<LoginBloc>()
                  .add(LoginUsernameChanged(email: value)),
              decoration: kLoginInputStyle(inputType.hint, inputType.icon)));
    });
  }

  Widget _passwordInput() {
    return BlocBuilder<LoginBloc, LoginBlocState>(builder: (context, state) {
      final inputType = LoginInputFormType.Password;
      return Container(
          child: TextFormField(
              cursorHeight: kCursorHeight,
              textAlignVertical: TextAlignVertical.center,
              validator: (value) =>
              state.isValidPassword ? null : "Password is invalid",
              onChanged: (value) => context
                  .read<LoginBloc>()
                  .add(LoginPasswordChanged(password: value)),
              decoration: kLoginInputStyle(inputType.hint, inputType.icon)));
    });
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginBlocState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : DecoratedBox(
            decoration: kLoginPageButtonStyle,
            child: ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(backgroundColor: kEmailLoginButtonColor,shadowColor: kEmailLoginButtonShadowColor),
                onPressed: () {
                  if(formEmailLoginKey.currentState!.validate()){
                    context.read<LoginBloc>().add(LoginSubmitted());
                  }
                },
                child: Center(
                  child: Text(
                    kLoginEmailButtonText,
                  ),
                )),
          );
    });
  }

  void _showSnackBar(BuildContext contex, String message){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}

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


