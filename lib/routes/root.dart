import 'package:cine_loomi/modules/auth/controller/auth_controller.dart';
import 'package:cine_loomi/modules/auth/view/home.dart';
import 'package:cine_loomi/modules/auth/view/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.firebaseUser.value == null ? SignInScreen() : Home();
    });
  }
}
