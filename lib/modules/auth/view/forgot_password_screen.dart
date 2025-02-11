import 'package:cine_loomi/modules/auth/controller/sign_in_controller.dart';
import 'package:cine_loomi/modules/auth/widgets/custom_text_field.dart';
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
    final SignInController signInController = Get.put(SignInController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              // Logo
              Image.asset(
                color: const Color.fromRGBO(255, 255, 255, 0.6),
                'assets/images/logo.png',
                width: 32,
                height: 32,
              ),
              const SizedBox(height: 56),

              // Título
              Text(
                'Forgot Password?',
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 24),
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
                controller: signInController.emailController,
              ),

              AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                height: isCollapsed ? 260 : 80,
                color: Colors.transparent,
              ),
              SizedBox(
                width: 250,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Send reset instructions',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              SizedBox(
                width: 240,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: Colors.transparent),
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
      ),
    );
  }
}
