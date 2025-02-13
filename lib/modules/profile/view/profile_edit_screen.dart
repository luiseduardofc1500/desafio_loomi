import 'package:cine_loomi/modules/profile/widgets/button_transparent.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Profile Edit Screen'),
          ButtonTransparent(
            labelText: 'Save',
            onPressed: () {
              print('Save');
            },
          ),
        ],
      ),
    );
  }
}
