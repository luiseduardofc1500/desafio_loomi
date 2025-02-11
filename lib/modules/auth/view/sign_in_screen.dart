import 'package:cine_loomi/modules/auth/controller/sign_in_controller.dart';
import 'package:cine_loomi/modules/auth/widgets/password_text_field.dart';
import 'package:cine_loomi/modules/auth/widgets/social_sign_up_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final SignInController signInController = Get.put(SignInController());

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
                'Welcome Back!',
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              const SizedBox(height: 8),
              Text(
                'Look who is here!',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 56),
              const SizedBox(height: 32),
              CustomTextField(
                labelText: 'Email',
                controller: signInController.emailController,
              ),
              const SizedBox(height: 16),
              PasswordTextField(
                labelText: 'Password',
                controller: signInController.passwordController,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed('/SignIn/forgot-password');
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Forgot password?',
                    textAlign: TextAlign.end,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(170, 115, 240, 1),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (signInController.validateFields()) {
                      Get.toNamed('/SignUp/Complete');
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
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
                      'Or Sign in With',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const SocialSignUpButtons(),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/SignUp');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Sign Up!',
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: const Color.fromRGBO(170, 115, 240, 1),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
