import 'dart:io';

import 'package:cine_loomi/modules/auth/constants/firebase_auth_constants.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircleAvatar(
      radius: 60,
      backgroundColor: theme.colorScheme.secondary,
      child: ClipOval(
        child: Image.file(
          File(auth.currentUser?.photoURL ?? ''),
          width: 120,
          height: 120,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            Image.network(
              auth.currentUser?.photoURL ?? '',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            );
            return const Icon(
              Icons.person,
              size: 60,
            );
          },
        ),
      ),
    );
  }
}
