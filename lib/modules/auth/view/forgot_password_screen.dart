import 'package:cine_loomi/modules/auth/controller/auth_controller.dart';
import 'package:cine_loomi/modules/auth/controller/forgot_password_controller.dart';
import 'package:cine_loomi/modules/auth/widgets/button_account.dart';
import 'package:cine_loomi/modules/auth/widgets/custom_text_field.dart';
import 'package:cine_loomi/modules/auth/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isCollapsed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isCollapsed = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final AuthController authController = Get.put(AuthController());
    final ForgotPasswordController forgotPasswordController =
        Get.put(ForgotPasswordController());

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
                'Forgot Password?',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                height: isCollapsed ? 10 : 240,
                color: Colors.transparent,
              ),
              Text(
                'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                height: isCollapsed ? 60 : 120,
                color: Colors.transparent,
              ),
              CustomTextField(
                labelText: 'Email',
                controller: forgotPasswordController.emailController,
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                height: isCollapsed ? 260 : 120,
                color: Colors.transparent,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonAccount(
              onPressed: () async {
                if (forgotPasswordController.validateField()) {
                  await authController.resetPassword(
                      forgotPasswordController.emailController.text);
                }
                Get.offNamed('/SignIn/forgot-password/instructions');
              },
              labelText: 'Send reset instructions',
            ),
            SizedBox(
              width: 240,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.transparent),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text('Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
