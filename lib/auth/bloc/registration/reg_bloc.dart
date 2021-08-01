import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtt_test_app/auth/bloc/form_submission_status.dart';
import 'package:wtt_test_app/auth/bloc/registration/reg_bloc_events.dart';
import 'package:wtt_test_app/auth/bloc/registration/reg_bloc_states.dart';
import 'package:wtt_test_app/auth/login_repository.dart';

class RegistrationBloc
    extends Bloc<RegistrationBlocEvent, RegistrationBlocState> {
  RegistrationBloc(this.loginRepository) : super(RegistrationBlocState());
  final LoginRepository loginRepository;

  @override
  Stream<RegistrationBlocState> mapEventToState(
      RegistrationBlocEvent event) async* {
    if (event is RegistrationNumberChanged) {
      yield state.copyWith(number: event.number);
    } else if (event is RegistrationPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is RegistrationConfirmationPassChanged) {
      yield state.copyWith(confirmationPass: event.confirmationPass);
    } else if (event is RegistrationSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await loginRepository.signup(state.number, state.password);
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e as Exception));
      }
    }
  }
}
