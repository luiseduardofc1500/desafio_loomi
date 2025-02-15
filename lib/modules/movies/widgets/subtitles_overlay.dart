import 'package:flutter/material.dart';

class SubtitlesOverlay extends StatelessWidget {
  const SubtitlesOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: Colors.black54,
        child: const Text(
          'Legenda: Texto de exemplo da legenda.',
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
