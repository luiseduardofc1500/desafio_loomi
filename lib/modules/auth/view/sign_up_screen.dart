import 'package:cine_loomi/modules/auth/constants/firebase_auth_constants.dart';
import 'package:cine_loomi/modules/auth/controller/sign_up_controller.dart';
import 'package:cine_loomi/modules/auth/widgets/divider_text.dart';
import 'package:cine_loomi/modules/auth/widgets/text_with_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/social_sign_up_buttons.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/register_logo.png',
                width: 132,
                height: 98,
              ),
              const SizedBox(height: 8),
              TextWithTextButton(
                  onPressed: () {
                    Get.toNamed('SignIn');
                  },
                  labelText: 'Already have an account?',
                  buttonText: 'Sign In!'),
              const SizedBox(height: 42),
              Text(
                'Create an account',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 308,
                child: Text(
                  'To get started, please complete your account registration.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 42),
              SocialSignUpButtons(
                onGoogleTap: () {
                  authController.signInWithGoogle();
                },
                onAppleTap: () {},
              ),
              const SizedBox(height: 56),
              DividerText(text: 'Or Sign up With'),
              const SizedBox(height: 32),
              CustomTextField(
                labelText: 'Email',
                controller: signUpController.emailController,
              ),
              const SizedBox(height: 16),
              PasswordTextField(
                labelText: 'Password',
                controller: signUpController.passwordController,
              ),
              const SizedBox(height: 16),
              PasswordTextField(
                labelText: 'Confirm your Password',
                controller: signUpController.confirmPasswordController,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (signUpController.validateFields()) {
                      Future.delayed(const Duration(seconds: 2), () {
                        Get.toNamed('SignUp/Complete', arguments: {
                          'email': signUpController.emailController.text,
                          'password': signUpController.passwordController.text,
                        });
                      });
                    }
                  },
                  child: const Text('Create Account'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
