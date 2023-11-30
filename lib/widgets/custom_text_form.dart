import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final String? hint;
  final bool? pass;
  final Widget? suffixIcon;
  final String? text;
  final bool? enable;
  final Widget? icon;

  final Widget? prefixIcon;
  const CustomTextForm(
      {Key? key,
      this.controller,
      this.validation,
      this.hint,
      this.pass,
      this.suffixIcon,
      this.prefixIcon,
      this.icon,
      this.enable = true,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        controller: controller,
        validator: validation,
        obscureText: pass == true ? true : false,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(prefixIcon: icon!, labelText: text),
      ),
    );
  }
}
