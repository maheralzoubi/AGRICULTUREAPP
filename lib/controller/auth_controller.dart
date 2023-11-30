import 'package:agricultureapp/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthController extends GetxController {
  //textEditing login

  TextEditingController email =
      TextEditingController(text: "ahmad.je1999@gmail.com");
  TextEditingController password =
      TextEditingController(text: "dc7bfc2y1rl4k7u5m4");

  // form global key ...
  GlobalKey<FormState> keyState = GlobalKey<FormState>();

  //repository ...

  final AuthRepository _authRepository = AuthRepository();

  //loading

  bool _loading = false;

  bool get loading => _loading;

  loginApi() async {
    _loading = true;
    update();
    final String email = this.email.value.text;
    final String password = this.password.value.text;

    var data = await _authRepository.login(email, password);

    print(data);

    if (data["status"] == false) {
      Get.snackbar('faild ...', data["message"].toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      Get.offAndToNamed("bottom_bar_view");
    }

    _loading = false;
    update();
  }
}
