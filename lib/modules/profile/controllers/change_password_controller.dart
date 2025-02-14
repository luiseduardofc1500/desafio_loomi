import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool validateFields() {
    final currentPassword = currentPasswordController.text;
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (currentPassword.isEmpty ||
        newPassword.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Fill in all fields',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (newPassword != confirmPassword) {
      Get.snackbar('Error', 'The passwords do not match',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (newPassword.length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }
}
