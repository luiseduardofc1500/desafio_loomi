import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final userNameController = TextEditingController();

  bool validateFields() {
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        'Error',
        'Invalid email',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    if (password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in the password fields',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    if (password != confirmPassword) {
      Get.snackbar(
        'Error',
        'Passwords do not match',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    if (password.length < 6) {
      Get.snackbar(
        'Error',
        'Password must be at least 6 characters long',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return true;
  }

  bool validateFieldUser() {
    final userName = userNameController.text.trim();
    if (userName.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in the name field',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return true;
  }
}
