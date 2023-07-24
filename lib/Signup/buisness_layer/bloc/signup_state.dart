part of 'signup_bloc.dart';

final class SignupState extends Equatable {
  const SignupState({
    this.status = FormzSubmissionStatus.initial,
    this.emailAddress = const EmailAddress.pure(),
    this.password = const Password.pure(),
    this.username = const Username.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final EmailAddress emailAddress;
  final Password password;
  final Username username;
  final bool isValid;

  SignupState copyWith({
    FormzSubmissionStatus? status,
    EmailAddress? emailAddress,
    Password? password,
    Username? username,
    bool? isValid,
  }) {
    return SignupState(
      status: status ?? this.status,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      username: username ?? this.username,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, emailAddress, password, username];
}
