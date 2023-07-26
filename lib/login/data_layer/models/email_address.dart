import 'package:formz/formz.dart';

enum EmailValidationError {
  empty,
  tooShortLength,
  tooLongLength,
  emailNotValid,
}

/// EmailAddress extends FormzInput to handle validations

class EmailAddress extends FormzInput<String, EmailValidationError> {
  const EmailAddress.pure() : super.pure('');
  const EmailAddress.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    //email validator regex
    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) return EmailValidationError.empty;
    if (!emailRegex.hasMatch(value)) {
      return EmailValidationError.emailNotValid;
    }
    if (value.length > 20) return EmailValidationError.tooLongLength;
    if (value.length < 6) return EmailValidationError.tooShortLength;

    return null;
  }
}
