import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);
  RxBool inProcess = false.obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    inProcess.value = true;
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    } else {
      Get.snackbar(
        'Warning',
        'No photo selected',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    inProcess.value = false;
  }
}
