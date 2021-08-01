abstract class RegistrationBlocEvent {}

class RegistrationNumberChanged extends RegistrationBlocEvent {
  final String number;

  RegistrationNumberChanged({required this.number});
}

class RegistrationPasswordChanged extends RegistrationBlocEvent {
  final String password;

  RegistrationPasswordChanged({required this.password});
}

class RegistrationConfirmationPassChanged extends RegistrationBlocEvent {
  final String confirmationPass;

  RegistrationConfirmationPassChanged({required this.confirmationPass});
}

class RegistrationSubmitted extends RegistrationBlocEvent {}
