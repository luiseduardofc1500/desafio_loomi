import 'package:flutter/material.dart';

class ProfileButtonPrimary extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressed;

  const ProfileButtonPrimary({
    Key? key,
    required this.labelText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 140,
      height: 42,
      child: OutlinedButton(
        style: theme.outlinedButtonTheme.style,
        onPressed: onPressed,
        child: Text(
          labelText,
          style: theme.textTheme.headlineMedium,
        ),
      ),
    );
  }
}
