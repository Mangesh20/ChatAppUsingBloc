import 'package:chat_app_demo/login/data_layer/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:chat_app_demo/login/data_layer/models/models.dart';

part 'login_event.dart';
part 'login_state.dart';

///LoginBloc is used to handle login events and states
///
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginEmailAddressChanged>(_onEmailAddressChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onEmailAddressChanged(
    LoginEmailAddressChanged event,
    Emitter<LoginState> emit,
  ) {
    final emailAddress = EmailAddress.dirty(event.emailAddress);
    emit(
      state.copyWith(
        emailAddress: emailAddress,
        isValid: Formz.validate([state.password, emailAddress]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.emailAddress]),
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await _authenticationRepository.logIn(
          userName: state.emailAddress.value,
          password: state.password.value,
        );
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
        ));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
