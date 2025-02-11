// photo_selection_screen.dart
import 'package:cine_loomi/modules/auth/controller/photo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoSelectionScreen extends StatelessWidget {
  const PhotoSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PhotoController photoController = Get.put(PhotoController());
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('CHOOSE IMAGE')),
      body: SafeArea(
        child: Obx(() {
          if (photoController.inProcess.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () async {
                          await photoController.pickImage(ImageSource.camera);
                          if (photoController.selectedImage.value != null) {
                            Get.back();
                          }
                        },
                        child: Container(
                          width: 135,
                          height: 140,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(188, 76, 241, 0.2),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: const Color.fromRGBO(170, 115, 240, 1),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/camera.png',
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(height: 12),
                                SizedBox(
                                  width: 48,
                                  child: Text(
                                    'Take a photo',
                                    style: theme.textTheme.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await photoController.pickImage(ImageSource.gallery);
                          if (photoController.selectedImage.value != null) {
                            Get.back();
                          }
                        },
                        child: Container(
                          width: 135,
                          height: 140,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(187, 187, 187, 0.1),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: const Color.fromRGBO(215, 215, 215, 0.6),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/album.png',
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(height: 12),
                                SizedBox(
                                  width: 48,
                                  child: Text(
                                    'Take a photo',
                                    style: theme.textTheme.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
