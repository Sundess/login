import 'package:get/get.dart';

String? emailValidator(String? value) {
  if (value == null) {
    return 'Enter email.';
  }
  if (!GetUtils.isEmail(value)) {
    return 'Please enter valid email';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Required';
  }
  return null;
}
