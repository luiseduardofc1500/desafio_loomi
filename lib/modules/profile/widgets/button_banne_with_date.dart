import 'package:flutter/material.dart';

class ButtonBanneWithDate extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonBanneWithDate({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Subscriptions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListTile(
          contentPadding:
              const EdgeInsets.only(left: 0, right: 22, top: 4, bottom: 4),
          tileColor: Color.fromRGBO(51, 51, 63, 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          leading: Image(
            image: AssetImage('assets/images/image_sub.png'),
            height: 67,
            width: 68,
          ),
          title: Text(
            'STREAM Premium',
            style: theme.textTheme.titleMedium
                ?.copyWith(color: Colors.white, fontSize: 16),
          ),
          subtitle: const Text(
            'Jan 22, 2023',
            style: TextStyle(color: Colors.white70),
          ),
          trailing: Text('Coming soon',
              style: theme.textTheme.headlineMedium
                  ?.copyWith(fontSize: 12, fontWeight: FontWeight.w400)),
          onTap: onPressed,
        ),
      ],
    );
  }
}
