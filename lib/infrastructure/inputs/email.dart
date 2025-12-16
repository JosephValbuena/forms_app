import 'package:formz/formz.dart';

// Define input validation errors
enum EmailInputError { empty, format }

class Email extends FormzInput<String, EmailInputError> {
  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  const Email.pure() : super.pure('');

  const Email.dirty(super.value) : super.dirty();


  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailInputError.empty) return 'El campo es requerido';
    if (displayError == EmailInputError.format) return 'El correo no cumple con un formato válido';

    return null;
  }

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailInputError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailInputError.format;
    return null;
  }
}
