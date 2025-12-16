import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameInputError { empty, length }

class Username extends FormzInput<String, UsernameInputError> {
  const Username.pure() : super.pure('');

  const Username.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == UsernameInputError.empty) return 'El campo es requerido';
    if (displayError == UsernameInputError.length) return 'Mínimo 6 caracteres';

    return null;
  }

  @override
  UsernameInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameInputError.empty;

    if (value.length < 6) return UsernameInputError.length;

    return null;
  }
}
