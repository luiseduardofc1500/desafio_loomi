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
    if (password.length < 6) {
      Get.snackbar('Erro', 'Senha deve ter no mínimo 6 caracteres',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }

  bool validateFieldUser() {
    final userName = userNameController.text.trim();
    if (userName.isEmpty) {
      Get.snackbar('Erro', 'Preencha o campo de nome',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }
}
