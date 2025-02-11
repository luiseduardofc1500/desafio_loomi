import 'package:flutter/material.dart';

class ButtonAccount extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressed;

  const ButtonAccount({
    Key? key,
    required this.onPressed,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(labelText),
      ),
    );
  }
}
