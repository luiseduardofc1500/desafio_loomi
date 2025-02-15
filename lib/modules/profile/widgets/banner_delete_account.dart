import 'package:cine_loomi/modules/auth/constants/firebase_auth_constants.dart';
import 'package:cine_loomi/modules/profile/widgets/button_delete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerDeleteAccount extends StatelessWidget {
  const BannerDeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Warning'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: theme.colorScheme.secondary,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 18,
          children: [
            SizedBox(
              width: 300,
              child: Text('Are you sure you want to delete your account?',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelMedium
                      ?.copyWith(fontSize: 14, fontWeight: FontWeight.w900)),
            ),
            Center(
              child: Container(
                width: 300,
                child: Text(
                  "This action is irreversible and all of your data will be permanently deleted. If you're having any issues with our app, we'd love to help you resolve them.",
                  style: theme.textTheme.labelMedium?.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: Colors.transparent)),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                ButtonDelete(
                    onPressed: () {
                      authController.deleteAccount();
                    },
                    labelText: 'Delete account'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
