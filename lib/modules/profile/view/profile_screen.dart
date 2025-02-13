import 'package:cine_loomi/modules/auth/constants/firebase_auth_constants.dart';
import 'package:cine_loomi/modules/profile/widgets/button_banne_with_date.dart';
import 'package:cine_loomi/modules/profile/widgets/button_banner.dart';
import 'package:cine_loomi/modules/profile/widgets/button_transparent.dart';
import 'package:cine_loomi/modules/profile/widgets/history_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: theme.colorScheme.secondary,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          ButtonTransparent(
            labelText: 'Edit Profile',
            onPressed: () {
              Get.toNamed('/home/profile/edit');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, top: 32),
        child: Column(
          spacing: 10,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 32,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: theme.colorScheme.secondary,
                  child: ClipOval(
                    child: Image.network(
                      auth.currentUser?.photoURL ?? '',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          size: 60,
                        );
                      },
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      auth.currentUser?.displayName ?? '',
                      style: theme.textTheme.displayLarge,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            ButtonBanner(
                labelText: 'Change Password',
                onPressed: () {},
                linkImage: 'assets/images/Shield.png'),
            ButtonBanner(
                labelText: 'Delete my account',
                onPressed: () {},
                linkImage: 'assets/images/Trash.png'),
            SizedBox(height: 24),
            ButtonBanneWithDate(onPressed: () {}),
            SizedBox(height: 24),
            HistoryList(),
            ButtonTransparent(
                labelText: 'Log Out',
                onPressed: () {
                  authController.signOut();
                }),
          ],
        ),
      ),
    );
  }
}
