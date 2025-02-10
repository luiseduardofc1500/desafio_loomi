import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF131418);
const brightness = Brightness.dark;

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF9B51E0),
      secondary: const Color(0xFF9B51E0),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: GoogleFonts.epilogue().fontFamily,
        fontSize: 22,
      ),
      titleMedium: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: const Color.fromRGBO(255, 255, 255, 0.45),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: const Color.fromRGBO(85, 82, 82, 1),
        fontFamily: GoogleFonts.outfit().fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(188, 76, 241, 0.2),
        side: const BorderSide(
          color: Color.fromRGBO(170, 115, 240, 1),
          width: 0.92,
        ),
        elevation: 0,
        shadowColor: const Color.fromRGBO(241, 204, 76, 0.2),
        fixedSize: const Size(208, 42),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.33),
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        foregroundColor: Color.fromRGBO(170, 115, 240, 1),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color.fromRGBO(35, 37, 44, 1),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: Color.fromRGBO(108, 109, 122, 1),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: Color.fromRGBO(108, 109, 122, 1),
          width: 1,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: Color.fromRGBO(108, 109, 122, 1),
          width: 1,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      hintStyle: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.45),
          fontWeight: FontWeight.w400),
      labelStyle: const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.45)),
      suffixIconColor: Color.fromRGBO(255, 255, 255, 0.45),
    ),
  );
}
