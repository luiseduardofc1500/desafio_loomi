import 'package:cine_loomi/modules/auth/constants/firebase_auth_constants.dart';
import 'package:cine_loomi/modules/profile/widgets/avatar.dart';
import 'package:cine_loomi/modules/profile/widgets/banner_delete_account.dart';
import 'package:cine_loomi/modules/profile/widgets/button_banne_with_date.dart';
import 'package:cine_loomi/modules/profile/widgets/button_banner.dart';
import 'package:cine_loomi/modules/profile/widgets/button_sign_out.dart';
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
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: theme.colorScheme.secondary,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, top: 16),
          child: Column(
            spacing: 8,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 32,
                children: [
                  Avatar(
                    radius: 60,
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
              SizedBox(height: 14),
              ButtonBanner(
                  labelText: 'Change Password',
                  onPressed: () {
                    Get.toNamed('/home/profile/change-password');
                  },
                  linkImage: 'assets/images/Shield.png'),
              ButtonBanner(
                  labelText: 'Delete my account',
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.4,
                      ),
                      builder: (BuildContext context) {
                        return BannerDeleteAccount();
                      },
                    );
                  },
                  linkImage: 'assets/images/Trash.png'),
              SizedBox(height: 14),
              ButtonBanneWithDate(onPressed: () {
                Get.toNamed('/home/profile/plans-details');
              }),
              SizedBox(height: 14),
              HistoryList(),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 32),
                child: ButtonSignOut(
                    labelText: 'Log Out',
                    onPressed: () {
                      authController.signOut();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
