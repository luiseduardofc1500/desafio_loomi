import 'package:flutter/material.dart';

class BuildSettingSection extends StatelessWidget {
  const BuildSettingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          tileColor: Color.fromRGBO(51, 51, 63, 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          leading: Image(
            image: AssetImage('assets/images/Shield.png'),
            width: 20,
            height: 20,
          ),
          title: Text(
            'Change Password',
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: Colors.white, fontSize: 16),
          ),
          trailing: const Icon(Icons.arrow_forward_ios,
              color: Colors.white, size: 16),
          onTap: () {
            // Navigate to change password screen
          },
        ),
        const SizedBox(height: 8),
        ListTile(
          tileColor: Color.fromRGBO(51, 51, 63, 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          leading: Image(
            image: AssetImage('assets/images/Trash.png'),
            width: 20,
            height: 20,
          ),
          title: Text(
            'Delete my account',
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: Colors.white, fontSize: 16),
          ),
          trailing: const Icon(Icons.arrow_forward_ios,
              color: Colors.white, size: 16),
          onTap: () {
            // Navigate to change password screen
          },
        ),
      ],
    );
  }
}
