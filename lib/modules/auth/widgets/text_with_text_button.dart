import 'package:flutter/material.dart';

class TextWithTextButton extends StatelessWidget {
  final String labelText;
  final String buttonText;
  final VoidCallback onPressed;

  const TextWithTextButton({
    Key? key,
    required this.onPressed,
    required this.labelText,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelText,
          style: theme.textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Text(
            buttonText,
            style: theme.textTheme.bodyMedium?.copyWith(
                color: const Color.fromRGBO(170, 115, 240, 1),
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
