import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The close button overlay to exit the player.
class CloseButtonOverlay extends StatelessWidget {
  const CloseButtonOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: IconButton(
        icon: const Icon(Icons.close, color: Colors.white),
        onPressed: () {
          Get.offAllNamed('/home');
        },
      ),
    );
  }
}
