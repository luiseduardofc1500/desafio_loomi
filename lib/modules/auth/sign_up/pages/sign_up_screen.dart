import 'package:flutter/material.dart';
import '../widgets/social_sign_up_buttons.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
              const SizedBox(height: 32),
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
              Text(
                'To get started, please complete your account registration.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
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
              const SizedBox(height: 24),
              const CustomTextField(labelText: 'Email'),
              const SizedBox(height: 16),
              const PasswordTextField(labelText: 'Password'),
              const SizedBox(height: 16),
              const PasswordTextField(labelText: 'Confirm your Password'),
              const SizedBox(height: 32),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
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
