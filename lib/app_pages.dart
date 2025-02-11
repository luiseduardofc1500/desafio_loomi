import 'package:cine_loomi/modules/auth/bindings/photo_binding.dart';
import 'package:cine_loomi/modules/auth/view/complete_sign_up_screen.dart';
import 'package:cine_loomi/modules/auth/view/forgot_password_screen.dart';
import 'package:cine_loomi/modules/auth/view/photo_selection_screen.dart';
import 'package:cine_loomi/modules/auth/view/sign_in_screen.dart';
import 'package:cine_loomi/modules/auth/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/SignUp',
      page: () => SignUpScreen(),
      children: [
        GetPage(
            name: '/Complete',
            page: () => CompleteSignUpScreen(),
            binding: PhotoBinding(),
            children: [
              GetPage(
                name: '/photo-selection',
                page: () => PhotoSelectionScreen(),
              ),
            ]),
      ],
    ),
    GetPage(name: '/SignIn', page: () => SignInScreen(), children: [
      GetPage(
        name: '/forgot-password',
        page: () => ForgotPasswordScreen(),
      )
    ]),
    GetPage(name: '/home', page: () => Container()),
    // Outras rotas podem ser adicionadas aqui
  ];
}
