import 'package:get/utils.dart';

String? validateEmail(String? val) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regex = RegExp(pattern.toString());
  if (!regex.hasMatch(
    val!.trim(),
  )) {
    return 'invalid email'.tr;
  }
  return null;
}

String? validatePassword(String? value) {
  if (value!.length < 6) {
    return 'invalid password'.tr;
  }
  return null;
}

String? validateUsertName(String? value) {
  if (value!.length < 3) {
    return 'invalid username'.tr;
  }
  return null;
}
