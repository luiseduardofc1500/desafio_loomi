import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final userNameController = TextEditingController();

  bool validateFields() {
    final nameUser = userNameController.text;

    if (nameUser.isEmpty) {
      Get.snackbar('Error', 'name can not be empty',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }

    return true;
  }
}
