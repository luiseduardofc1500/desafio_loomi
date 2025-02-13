import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  bool validateField() {
    final email = emailController.text.trim();

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Invalid email',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }

    return true;
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
