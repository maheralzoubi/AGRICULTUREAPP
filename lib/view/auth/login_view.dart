import 'package:agricultureapp/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/validation.dart';
import '../../controller/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xfff2f3f7),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().primaryColor,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://wallpapersmug.com/download/320x480/bab82e/farm-field-landscape-green.jpg",
                    )),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLogo(),
                _buildContainer(),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Text(
            'AGRICULTURE',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (AuthController controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 30,
                          ),
                        )
                      ],
                    ),
                    Form(
                        key: controller.keyState,
                        child: Column(
                          children: [
                            CustomTextForm(
                              controller: controller.email,
                              hint: "",
                              text: "Email",
                              validation: validateEmail,
                              pass: false,
                              icon: Icon(
                                Icons.email,
                                color: AppColors().primaryColor,
                              ),
                            ),
                            CustomTextForm(
                              controller: controller.password,
                              hint: "",
                              text: "Password",
                              validation: validatePassword,
                              pass: true,
                              icon: Icon(Icons.password,
                                  color: AppColors().primaryColor),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomButton(
                        controller: controller,
                        width: double.infinity,
                        height: 50,
                        color: AppColors().primaryColor,
                        text: "Login",
                        onTap: () {
                          if (controller.keyState.currentState!.validate() ==
                              true) {
                            controller.loginApi();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
