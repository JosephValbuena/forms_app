import 'package:formz/formz.dart';

enum PasswordInputError {empty, length}

class Password extends FormzInput<String, PasswordInputError> {
  const Password.pure() : super.pure('');

  const Password.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordInputError.empty) return 'El campo es requerido';
    if (displayError == PasswordInputError.length) return 'Mínimo 6 caracteres';

    return null;
  }

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordInputError.empty;
    if (value.length < 6) return PasswordInputError.length;

    return null;
  }
}