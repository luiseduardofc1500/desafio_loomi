import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validateFields() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Invalid email',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (password.isEmpty) {
      Get.snackbar('Error', 'Please fill in the password field',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }

    return true;
  }
}
