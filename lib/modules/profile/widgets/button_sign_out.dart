import 'package:flutter/material.dart';

class ButtonSignOut extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressed;

  const ButtonSignOut({
    Key? key,
    required this.onPressed,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 140,
      height: 42,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Colors.white,
            width: 0.8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          labelText,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
