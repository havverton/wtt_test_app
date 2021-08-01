abstract class LoginBlocEvent {}

class LoginUsernameChanged extends LoginBlocEvent {
  final String email;

  LoginUsernameChanged({required this.email});
}

class LoginPasswordChanged extends LoginBlocEvent {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginSubmitted extends LoginBlocEvent {}
