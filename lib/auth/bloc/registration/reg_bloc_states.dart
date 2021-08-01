import 'package:wtt_test_app/auth/bloc/form_submission_status.dart';

class RegistrationBlocState {
  final String number;

  final numberRegExp = RegExp(r"^[0-9\-\+]{9,15}$");

  bool get isValidNumber => numberRegExp.hasMatch(number);

  final String password;
  final passwordRegExp =
      new RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$");

  bool get isValidPassword => passwordRegExp.hasMatch(password);

  final String confirmationPass;
  final confirmationPassRegExp =
      new RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$");

  bool get isPasswordSame => (password == confirmationPass);
  final FormSubmissionStatus formStatus;

  RegistrationBlocState({
    this.number = "",
    this.password = "",
    this.confirmationPass = "",
    this.formStatus = const InitialFormStatus(),
  });

  RegistrationBlocState copyWith({
    String? number,
    String? password,
    String? confirmationPass,
    FormSubmissionStatus? formStatus,
  }) {
    return RegistrationBlocState(
      number: number ?? this.number,
      password: password ?? this.password,
      confirmationPass: confirmationPass ?? this.confirmationPass,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
