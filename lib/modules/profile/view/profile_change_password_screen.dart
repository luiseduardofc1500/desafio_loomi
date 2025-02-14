import 'package:cine_loomi/modules/auth/constants/firebase_auth_constants.dart';
import 'package:cine_loomi/modules/auth/widgets/button_account.dart';
import 'package:cine_loomi/modules/auth/widgets/password_text_field.dart';
import 'package:cine_loomi/modules/profile/controllers/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileChangePasswordScreen extends StatelessWidget {
  ProfileChangePasswordScreen({super.key});

  final ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());

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
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      'Change',
                      style: theme.textTheme.displayLarge,
                    ),
                    Text(
                      'Password',
                      style: theme.textTheme.displayLarge,
                    ),
                  ],
                ),
                SizedBox(height: 14),
                PasswordTextField(
                  labelText: 'Current Password',
                  controller:
                      changePasswordController.currentPasswordController,
                ),
                Divider(
                  color: Color.fromRGBO(108, 109, 122, 0.2),
                  thickness: 1,
                ),
                PasswordTextField(
                  labelText: 'New Password',
                  controller: changePasswordController.newPasswordController,
                ),
                PasswordTextField(
                  labelText: 'Confirm new password',
                  controller:
                      changePasswordController.confirmPasswordController,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: ButtonAccount(
            onPressed: () {
              if (changePasswordController.validateFields()) {
                authController.updatePassword(
                    changePasswordController.newPasswordController.text);
              }
            },
            labelText: 'Update Password'),
      ),
    );
  }
}
