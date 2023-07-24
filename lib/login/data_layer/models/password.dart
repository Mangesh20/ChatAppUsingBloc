import 'package:formz/formz.dart';

enum PasswordValidationError { empty, tooShortLength, tooLongLength }

/// Password extends FormzInput to handle validations 

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    if (value.length < 6) return PasswordValidationError.tooShortLength;
    if (value.length > 20) return PasswordValidationError.tooLongLength;
    return null;
  }
}
