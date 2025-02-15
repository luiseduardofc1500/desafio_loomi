import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloseButtonOverlay extends StatelessWidget {
  const CloseButtonOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.purple),
        onPressed: () {
          Get.offAllNamed('/home');
        },
      ),
    );
  }
}
