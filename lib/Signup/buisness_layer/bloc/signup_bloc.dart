import 'package:bloc/bloc.dart';
import 'package:chat_app_demo/Signup/data_layer/models/username.dart';
import 'package:chat_app_demo/Signup/data_layer/repositories/create_account_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:chat_app_demo/login/data_layer/models/models.dart';
part 'signup_event.dart';
part 'signup_state.dart';

///  SignupBloc is used to handle events and states
///
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc({required accountCreateRepository})
      : _accountCreateRepository = accountCreateRepository,
        super(const SignupState()) {
    on<SignupUsernameChanged>(_onUsernameChanged);
    on<SignupPasswordChanged>(_onPasswordChanged);
    on<SignupEmailAddressChanged>(_onEmailAddressChanged);
    on<SignupSubmitted>(_onSubmitted);
  }

  final AccountCreateRepository _accountCreateRepository;

  void _onUsernameChanged(
    SignupUsernameChanged event,
    Emitter<SignupState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([state.emailAddress, username, state.password]),
      ),
    );
  }

  void _onEmailAddressChanged(
    SignupEmailAddressChanged event,
    Emitter<SignupState> emit,
  ) {
    final emailAddress = EmailAddress.dirty(event.emailAddress);
    emit(
      state.copyWith(
        emailAddress: emailAddress,
        isValid: Formz.validate([state.username, emailAddress, state.password]),
      ),
    );
  }

  void _onPasswordChanged(
    SignupPasswordChanged event,
    Emitter<SignupState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.emailAddress, state.username]),
      ),
    );
  }

  Future<User?> _onSubmitted(
    SignupSubmitted event,
    Emitter<SignupState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        final user = await _accountCreateRepository.signUp(
          name: state.username.value,
          email: state.emailAddress.value,
          password: state.password.value,
        );
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        return user;
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
    return null;
  }
}
