import 'regex_pattern.dart';

class Validators {
  static bool isValidEmail(String email) {
    return RegexPattern.emailRegExp.hasMatch(email);
  }

  static bool isValidPhone(String phone) {
    return RegexPattern.phoneRegExp.hasMatch(phone);
  }
}
