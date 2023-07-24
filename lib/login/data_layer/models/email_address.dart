import 'package:formz/formz.dart';

enum UsernameValidationError {
  empty,
  tooShortLength,
  tooLongLength,
  emailNotValid,
}
/// EmailAddress extends FormzInput to handle validations 

class EmailAddress extends FormzInput<String, UsernameValidationError> {
  const EmailAddress.pure() : super.pure('');
  const EmailAddress.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    //email validator regex
    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) return UsernameValidationError.empty;
    if (value.length > 20) return UsernameValidationError.tooLongLength;
    if (!emailRegex.hasMatch(value)) {
      return UsernameValidationError.emailNotValid;
    }
    return null;
  }
}
