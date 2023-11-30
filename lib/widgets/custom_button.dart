import 'package:agricultureapp/constants/color.dart';
import 'package:agricultureapp/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function? onTap;
  final Color? color;
  final double? width;
  final double height;
  final AuthController? controller;
  const CustomButton(
      {Key? key,
      this.text,
      this.controller,
      this.onTap,
      this.height = 40,
      this.color = Colors.blue,
      this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        color: color,
        onPressed: () {
          onTap!();
        },
        child: controller!.loading == true
            ? CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              )
            : Text(
                text!,
                style: const TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
