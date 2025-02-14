import 'dart:io';

import 'package:cine_loomi/modules/auth/constants/firebase_auth_constants.dart';
import 'package:cine_loomi/modules/auth/controller/photo_controller.dart';
import 'package:cine_loomi/modules/auth/widgets/button_account.dart';
import 'package:cine_loomi/modules/auth/widgets/custom_text_field.dart';
import 'package:cine_loomi/modules/profile/controllers/edit_profile_controller.dart';
import 'package:cine_loomi/modules/profile/widgets/avatar.dart';
import 'package:cine_loomi/modules/profile/widgets/photo_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final EditProfileController editProfileController = EditProfileController();
    PhotoController photoController = PhotoController();
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
                      'Edit',
                      style: theme.textTheme.displayLarge,
                    ),
                    Text(
                      'Profile',
                      style: theme.textTheme.displayLarge,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(children: [
                      Stack(
                        children: [
                          Avatar(),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                      ),
                                    ),
                                    builder: (context) {
                                      return PhotoSelector();
                                    });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(87, 79, 62, 1),
                                ),
                                padding: const EdgeInsets.all(4),
                                child: Image.asset(
                                  'assets/images/camera.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                    SizedBox(
                      width: 24,
                    ),
                    SizedBox(
                      width: 98,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CHOOSE IMAGE',
                            style: theme.textTheme.labelMedium,
                          ),
                          Text(
                              'A square .jpg, .gif, or .png image 200x200 or larger',
                              style: theme.textTheme.labelSmall),
                        ],
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  labelText: auth.currentUser?.displayName ?? '',
                  controller: editProfileController.userNameController,
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
              if (editProfileController.validateFields()) {
                auth.currentUser?.updateDisplayName(
                    editProfileController.userNameController.text);
              }
            },
            labelText: 'Update Profile'),
      ),
    );
  }
}
