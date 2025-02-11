// password_text_field.dart
import 'package:cine_loomi/modules/auth/controller/password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? tag;

  PasswordTextField({
    Key? key,
    required this.labelText,
    this.controller,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PasswordController passwordController = Get.put(
      PasswordController(),
      tag: tag ?? labelText,
    );

    return Obx(() => TextFormField(
          controller: controller,
          obscureText: passwordController.obscureText.value,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: IconButton(
              icon: Icon(
                passwordController.obscureText.value
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
              onPressed: passwordController.toggleVisibility,
            ),
          ),
        ));
  }
}
