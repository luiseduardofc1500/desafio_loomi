import 'package:cine_loomi/modules/auth/widgets/button_account.dart';
import 'package:cine_loomi/modules/auth/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({super.key});

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
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

    return Scaffold(
      backgroundColor: Colors.black,
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
                'The instructions were sent!',
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
              onPressed: () {
                Get.toNamed('/SignIn');
              },
              labelText: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
