import 'package:flutter/material.dart';

class SocialSignUpButtons extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onAppleTap;
  const SocialSignUpButtons(
      {Key? key, required this.onGoogleTap, required this.onAppleTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            onGoogleTap();
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromRGBO(188, 76, 241, 0.2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/google_logo.png',
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        InkWell(
          onTap: onAppleTap,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.33),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.apple,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
