import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  final String text;

  const DividerText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: theme.textTheme.bodySmall,
          ),
        ),
        const Expanded(
          child: Divider(color: Colors.grey),
        ),
      ],
    );
  }
}
