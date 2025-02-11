import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      color: Color.fromRGBO(255, 255, 255, 0.6),
      'assets/images/logo.png',
      width: 32,
      height: 32,
    );
  }
}
