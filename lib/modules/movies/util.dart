import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<LinearGradient?> createMovieGradient(String imageUrl) async {
  try {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(NetworkImage(imageUrl));

    final Color? dominantColor = paletteGenerator.dominantColor?.color;
    final Color? vibrantColor = paletteGenerator.vibrantColor?.color;
    final Color? mutedColor = paletteGenerator.mutedColor?.color;

    return LinearGradient(
      colors: [
        Colors.transparent,
        mutedColor?.withAlpha((0.25 * 255).toInt()) ?? Colors.black26,
        vibrantColor?.withAlpha((0.5 * 255).toInt()) ?? Colors.black45,
        vibrantColor?.withAlpha((0.75 * 255).toInt()) ?? Colors.black54,
        dominantColor?.withAlpha((0.9 * 255).toInt()) ?? Colors.black87,
      ],
      stops: const [0.0, 0.3, 0.6, 0.8, 1.0],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  } catch (e) {
    debugPrint("Error loading gradient: $e");
  }
  return null;
}
