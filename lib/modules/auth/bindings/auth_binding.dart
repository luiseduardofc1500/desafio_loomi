import 'package:cine_loomi/modules/auth/controller/auth_controller.dart';
import 'package:cine_loomi/modules/auth/controller/photo_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<PhotoController>(() => PhotoController());
  }
}
