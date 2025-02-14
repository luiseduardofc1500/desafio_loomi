import 'package:flutter/material.dart';

class ButtonDelete extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressed;

  const ButtonDelete({
    Key? key,
    required this.onPressed,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(labelText),
      ),
    );
  }
}
