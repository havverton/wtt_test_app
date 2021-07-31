import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtt_test_app/auth/bloc/form_submission_status.dart';
import 'package:wtt_test_app/auth/bloc/login_bloc.dart';
import 'package:wtt_test_app/auth/bloc/login_bloc_events.dart';
import 'package:wtt_test_app/auth/login_repository.dart';
import 'package:wtt_test_app/auth/bloc/login_bloc_states.dart';
import 'package:wtt_test_app/colors.dart';
import 'package:wtt_test_app/strings.dart';
import 'package:wtt_test_app/styles.dart';
import 'package:wtt_test_app/widgets/inputs/extensions/login_email_extension.dart';

class LoginEmailFieldsWidget extends StatefulWidget {
  @override
  _LoginEmailFieldsWidgetState createState() => _LoginEmailFieldsWidgetState();
}

class _LoginEmailFieldsWidgetState extends State<LoginEmailFieldsWidget> {
  final _formKey = GlobalKey<FormState>();

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
    },
        child: Container(
            child: Form(
              key: _formKey,
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
              cursorColor: kCursorColor,
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
              cursorColor: kCursorColor,
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
          : Material(
        child: Ink(
          height: kMediumButtonHeight,
          decoration: kLoginPageButtonStyle,
          child: InkWell(
              borderRadius: kMediumButtonBorderRadius,
              onTap: () {
                if(_formKey.currentState!.validate()){
                  context.read<LoginBloc>().add(LoginSubmitted());
                }
              },
              child: Container(
                child: Center(
                  child: Text(
                    kLoginEmailButtonText,
                    style: kLoginButtonTextStyle,
                  ),
                ),
              )),
        ),
      );
    });
  }

  void _showSnackBar(BuildContext contex, String message){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}

