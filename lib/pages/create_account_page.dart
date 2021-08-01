import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wtt_test_app/auth/bloc/form_submission_status.dart';
import 'package:wtt_test_app/auth/bloc/registration/reg_bloc.dart';
import 'package:wtt_test_app/auth/bloc/registration/reg_bloc_events.dart';
import 'package:wtt_test_app/auth/bloc/registration/reg_bloc_states.dart';
import 'package:wtt_test_app/auth/login_repository.dart';
import 'package:wtt_test_app/pages/success_page.dart';
import 'package:wtt_test_app/utils/colors.dart';
import 'package:wtt_test_app/utils/keys.dart';
import 'package:wtt_test_app/utils/strings.dart';
import 'package:wtt_test_app/utils/styles.dart';

import 'package:wtt_test_app/widgets/inputs/registration_inputs.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    _visible = (MediaQuery.of(context).viewInsets.bottom == 0);
    return BlocProvider(
        create: (context) => RegistrationBloc(AuthRepository()),
        child: BlocListener<RegistrationBloc, RegistrationBlocState>(
          listener: (context, state) {
            final formStatus = state.formStatus;
            if (formStatus is SubmissionSuccess) {
              Navigator.popAndPushNamed(context, "/success",
                  arguments:
                      RegistrationArguments(state.number, state.password));
            }
          },
          child: Scaffold(
            body: Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 150),
                  height: (MediaQuery.of(context).viewInsets.bottom != 0)
                      ? kPlaceholderHeightShort
                      : kPlaceholderHeightFull,
                  decoration: kMainPlaceholderDecoration,
                  child: Center(
                    child: AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 150),
                        child: Text(kPlaceholderRegistrationText,
                            style: Theme.of(context).textTheme.headline1,
                            textAlign: TextAlign.center)),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.5.h),
                    child: Form(
                      key: formEmailLoginKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _phoneTextField(),
                            _passwordTextField(),
                            _passwordConfirmationTextField(),
                            _confirmButton(context)
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

Widget _phoneTextField() {
  return BlocBuilder<RegistrationBloc, RegistrationBlocState>(
      builder: (context, state) {
    final inputType = RegistrationInputType.phone;

    return TextFormField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        cursorHeight: kCursorHeight,
        textAlignVertical: TextAlignVertical.center,
        validator: (value) =>
            state.isValidNumber ? null : kRegistrationNumberError,
        onChanged: (value) => context
            .read<RegistrationBloc>()
            .add(RegistrationNumberChanged(number: value)),
        decoration: kRegistrationInputStyle(inputType.hint, inputType.icon));
  });
}

Widget _passwordTextField() {
  return BlocBuilder<RegistrationBloc, RegistrationBlocState>(
      builder: (context, state) {
    final inputType = RegistrationInputType.password;

    return TextFormField(
        cursorHeight: kCursorHeight,
        textAlignVertical: TextAlignVertical.center,
        validator: (value) =>
            state.isValidPassword ? null : kRegistrationPasswordError,
        onChanged: (value) => context
            .read<RegistrationBloc>()
            .add(RegistrationPasswordChanged(password: value)),
        decoration: kRegistrationInputStyle(inputType.hint, inputType.icon));
  });
}

Widget _passwordConfirmationTextField() {
  return BlocBuilder<RegistrationBloc, RegistrationBlocState>(
      builder: (context, state) {
    final inputType = RegistrationInputType.confirmPassword;
    return TextFormField(
        cursorHeight: kCursorHeight,
        textAlignVertical: TextAlignVertical.center,
        validator: (value) =>
            state.isPasswordSame ? null : kRegistrationConfirmationError,
        onChanged: (value) => context
            .read<RegistrationBloc>()
            .add(RegistrationConfirmationPassChanged(confirmationPass: value)),
        decoration: kRegistrationInputStyle(inputType.hint, inputType.icon));
  });
}

Widget _confirmButton(BuildContext context) {
  return BlocBuilder<RegistrationBloc, RegistrationBlocState>(
      builder: (context, state) {
    return state.formStatus is FormSubmitting
        ? CircularProgressIndicator()
        : ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: kRegistrationButtonColor,
                foregroundColor: kRegistrationButtonTextColor),
            onPressed: () {
              if (formEmailLoginKey.currentState!.validate()) {
                context.read<RegistrationBloc>().add(RegistrationSubmitted());
              }
            },
            child: Center(
              child: Text(kRegistrationButtonText),
            ),
          );
  });
}
