part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.emailAddress = const EmailAddress.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final EmailAddress emailAddress;
  final Password password;
  final bool isValid;

  ///The copyWith method in the LoginState class is a common pattern for implementing immutability in Dart.
  ///Immutability means that the state object can't be changed once it's created.
  ///If you need to change the state, you have to create a new state object.
  ///The copyWith method helps with this. It creates a new LoginState object with the updated
  LoginState copyWith({
    FormzSubmissionStatus? status,
    EmailAddress? emailAddress,
    Password? password,
    bool? isValid,
  }) {
    return LoginState(
      status: status ?? this.status,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, emailAddress, password];
}
