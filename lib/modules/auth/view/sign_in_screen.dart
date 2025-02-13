import 'package:cine_loomi/modules/auth/constants/firebase_auth_constants.dart';
import 'package:cine_loomi/modules/auth/controller/sign_in_controller.dart';
import 'package:cine_loomi/modules/auth/widgets/button_account.dart';
import 'package:cine_loomi/modules/auth/widgets/divider_text.dart';
import 'package:cine_loomi/modules/auth/widgets/logo_widget.dart';
import 'package:cine_loomi/modules/auth/widgets/password_text_field.dart';
import 'package:cine_loomi/modules/auth/widgets/social_sign_up_buttons.dart';
import 'package:cine_loomi/modules/auth/widgets/text_with_text_button.dart';
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
              LogoWidget(),
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
              ButtonAccount(
                  onPressed: () {
                    authController.login(signInController.emailController.text,
                        signInController.passwordController.text);
                  },
                  labelText: 'Login'),
              const SizedBox(height: 32),
              DividerText(text: 'Or Sign in With'),
              const SizedBox(height: 32),
              SocialSignUpButtons(
                onGoogleTap: () {
                  authController.signInWithGoogle();
                },
                onAppleTap: () {},
              ),
              const SizedBox(height: 32),
              TextWithTextButton(
                  onPressed: () {
                    Get.offAllNamed('/SignUp');
                  },
                  labelText: "Don't have an account?",
                  buttonText: 'Sign Up!'),
            ],
          ),
        ),
      ),
    );
  }
}
