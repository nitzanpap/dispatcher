abstract class Validations {
  static String? getPasswordErrorMsgOrNull(String? value) {
    if (value == null) {
      return 'Invalid input!';
    }
    RegExp hasUpperCaseRegEx = RegExp(r'^(?=.*[A-Z])');
    RegExp hasLowerCaseRegEx = RegExp(r'^(?=.*[a-z])');
    RegExp hasDigitRegEx = RegExp(r'^(?=.*\d)');
    RegExp hasSpecialCharRegEx = RegExp(r'^(?=.*[@$!%*?&])');
    RegExp hasMin8CharsRegEx = RegExp(r'^.{8,}');

    if (!hasUpperCaseRegEx.hasMatch(value)) {
      return 'Password must contain at least 1 Upper case letter.';
    }
    if (!hasLowerCaseRegEx.hasMatch(value)) {
      return 'Password must contain at least 1 lower case letter.';
    }
    if (!hasDigitRegEx.hasMatch(value)) {
      return 'Password must contain at least 1 digit.';
    }
    if (!hasSpecialCharRegEx.hasMatch(value)) {
      return 'Password must contain at least 1 special character (@\$!%*?&).';
    }
    if (!hasMin8CharsRegEx.hasMatch(value)) {
      return 'Password must be at least 8 characters long.';
    }
    return null;
  }

  static String? getEmailErrorMsgOrNull(String? value) {
    return (_isValidEmail(value))
        ? null
        : 'Please enter a valid email address.';
  }

  static bool _isValidEmail(String? value) {
    RegExp isValidEmailRegEx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return (value != null && isValidEmailRegEx.hasMatch(value));
  }
}