part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

final class SignupUsernameChanged extends SignupEvent {
  const SignupUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class SignupEmailAddressChanged extends SignupEvent {
  const SignupEmailAddressChanged(this.emailAddress);

  final String emailAddress;

  @override
  List<Object> get props => [emailAddress];
}

final class SignupPasswordChanged extends SignupEvent {
  const SignupPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class SignupSubmitted extends SignupEvent {
  const SignupSubmitted();
}
