import 'package:formz/formz.dart';

enum UsernameValidationError { empty, tooShortLength, tooLongLength }

///Username class for input validation 
///
class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');
  const Username.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) return UsernameValidationError.empty;
    if (value.length < 6) return UsernameValidationError.tooShortLength;
    if (value.length > 30) return UsernameValidationError.tooLongLength;
    return null;
  }
}
