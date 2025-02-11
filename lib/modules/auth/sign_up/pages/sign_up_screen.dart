import 'package:cine_loomi/modules/auth/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/social_sign_up_buttons.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/password_text_field.dart';

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
              const SizedBox(height: 16),
              Image.asset(
                'assets/images/login_logo.png',
                width: 132,
                height: 98,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Sign In!',
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: const Color.fromRGBO(170, 115, 240, 1),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
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
              const SocialSignUpButtons(),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Or Sign up With',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: Colors.grey),
                  ),
                ],
              ),
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
                      Get.toNamed('/SignUp/Complete');
                    }
                  },
                  child: const Text('Create Account'),
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
