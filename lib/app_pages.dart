import 'package:cine_loomi/modules/auth/sign_up/pages/complete_sign_up_screen.dart';
import 'package:cine_loomi/modules/auth/sign_up/pages/sign_up_screen.dart';
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
        ),
      ],
    ),
    // Outras rotas podem ser adicionadas aqui
  ];
}
