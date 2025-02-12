import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validateFields() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Erro', 'Email inválido',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    if (password.isEmpty) {
      Get.snackbar('Erro', 'Preencha o campo de senha',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }

    return true;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
