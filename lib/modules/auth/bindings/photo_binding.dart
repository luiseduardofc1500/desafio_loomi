// photo_binding.dart
import 'package:cine_loomi/modules/auth/controller/photo_controller.dart';
import 'package:get/get.dart';

class PhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoController>(() => PhotoController());
  }
}
