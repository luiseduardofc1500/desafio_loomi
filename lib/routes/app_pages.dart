import 'package:cine_loomi/modules/auth/bindings/auth_binding.dart';
import 'package:cine_loomi/modules/auth/bindings/photo_binding.dart';
import 'package:cine_loomi/modules/auth/view/complete_sign_up_screen.dart';
import 'package:cine_loomi/modules/auth/view/forgot_password_screen.dart';
import 'package:cine_loomi/modules/auth/view/home.dart';
import 'package:cine_loomi/modules/auth/view/instructions_screen.dart';
import 'package:cine_loomi/modules/auth/view/photo_selection_screen.dart';
import 'package:cine_loomi/modules/auth/view/sign_in_screen.dart';
import 'package:cine_loomi/modules/auth/view/sign_up_screen.dart';
import 'package:cine_loomi/modules/profile/view/profile_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/SignUp',
      page: () => SignUpScreen(),
      binding: AuthBinding(),
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
          children: [
            GetPage(
              name: '/instructions',
              page: () => InstructionsScreen(),
            ),
          ])
    ]),
    GetPage(name: '/home', page: () => Home()),
    GetPage(name: '/profile', page: () => ProfileScreen()),
  ];
}
