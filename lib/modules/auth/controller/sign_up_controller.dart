import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool validateFields() {
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Erro', 'Email inválido',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar('Erro', 'Preencha os campos de senha',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (password != confirmPassword) {
      Get.snackbar('Erro', 'As senhas não coincidem',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
