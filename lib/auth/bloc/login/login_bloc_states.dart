
import 'package:wtt_test_app/auth/bloc/form_submission_status.dart';

class LoginBlocState{
  final String email;

  final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool get isValidEmail =>  emailRegExp.hasMatch(email);


  final String password;
  final passwordRegExp = new RegExp(
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$");
  bool get isValidPassword =>  passwordRegExp.hasMatch(password);
  final FormSubmissionStatus formStatus;

  LoginBlocState({this.email = "", this.password = "",  this.formStatus = const InitialFormStatus(),});

  LoginBlocState copyWith({
     String? username,
     String? password,
     FormSubmissionStatus? formStatus,

  }) {
    return LoginBlocState(
      email: username ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

