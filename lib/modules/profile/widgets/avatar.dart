import 'dart:io';

import 'package:cine_loomi/modules/auth/constants/firebase_auth_constants.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final int radius;
  const Avatar({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircleAvatar(
      radius: radius.toDouble(),
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: Image.file(
          File(auth.currentUser?.photoURL ?? ''),
          height: radius.toDouble() * 2,
          width: radius.toDouble() * 2,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              auth.currentUser?.photoURL ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: radius.toDouble() * 2,
                  height: radius.toDouble() * 2,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person_2_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
