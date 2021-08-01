import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtt_test_app/auth/bloc/form_submission_status.dart';
import 'package:wtt_test_app/auth/bloc/login/login_bloc_events.dart';
import 'package:wtt_test_app/auth/bloc/login/login_bloc_states.dart';

import 'package:wtt_test_app/auth/login_repository.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc(this.loginRepository) : super(LoginBlocState());
  final LoginRepository loginRepository;

  @override
  Stream<LoginBlocState> mapEventToState(LoginBlocEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.email);

      // Password updated
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form submitted
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await loginRepository.login(state.email, state.password);
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e as Exception));
      }
    }
  }
}
