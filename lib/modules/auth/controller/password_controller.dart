import 'package:get/get.dart';

class PasswordController extends GetxController {
  RxBool obscureText = true.obs;

  void toggleVisibility() {
    obscureText.value = !obscureText.value;
  }
}
