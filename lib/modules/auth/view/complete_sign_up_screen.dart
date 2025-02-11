import 'package:cine_loomi/modules/auth/controller/photo_controller.dart';
import 'package:cine_loomi/themes/app.theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_text_field.dart';

class CompleteSignUpScreen extends StatelessWidget {
  const CompleteSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final PhotoController photoController = Get.find<PhotoController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Image.asset(
                color: Color.fromRGBO(255, 255, 255, 0.6),
                'assets/images/logo.png',
                width: 32,
                height: 32,
              ),
              const SizedBox(height: 56),
              Text(
                'Tell us more!',
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              const SizedBox(height: 8),
              Text(
                'Complete your profile',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 56),
              Row(
                spacing: 24,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed('SignUp/Complete/photo-selection');
                    },
                    child: Obx(() {
                      // Se houver uma imagem selecionada, exibe-a; senão, mostra o ícone padrão
                      if (photoController.selectedImage.value != null) {
                        return Container(
                          width: 116,
                          height: 116,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: FileImage(
                                  photoController.selectedImage.value!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          width: 116,
                          height: 116,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(188, 76, 241, 0.2),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/camera.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        );
                      }
                    }),
                  ),
                  SizedBox(
                    width: 92,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CHOOSE IMAGE',
                          style: appTheme().textTheme.labelMedium,
                        ),
                        Text(
                            'A square .jpg, .gif, or .png image 200x200 or larger',
                            style: appTheme().textTheme.labelSmall),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 56),
              const CustomTextField(labelText: 'Your name'),
              const SizedBox(height: 56),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Continue'),
                ),
              ),
              const SizedBox(height: 2),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: Colors.transparent)),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Back'),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
