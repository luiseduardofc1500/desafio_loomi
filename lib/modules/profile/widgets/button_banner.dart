import 'package:flutter/material.dart';

class ButtonBanner extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressed;
  final String linkImage;

  ButtonBanner(
      {super.key,
      required this.labelText,
      required this.onPressed,
      required this.linkImage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      tileColor: Color.fromRGBO(51, 51, 63, 0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      leading: Image(
        image: AssetImage(linkImage),
        width: 20,
        height: 20,
      ),
      title: Text(
        labelText,
        style: theme.textTheme.bodyMedium
            ?.copyWith(color: Colors.white, fontSize: 16),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
      onTap: onPressed,
    );
  }
}
