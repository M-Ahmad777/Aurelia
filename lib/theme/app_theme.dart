import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFF080F0A);
  static const Color surface = Color(0xFF0D1A10);
  static const Color card = Color(0xFF121E15);
  static const Color cardElevated = Color(0xFF192B1D);
  static const Color gold = Color(0xFFC9A84C);
  static const Color goldLight = Color(0xFFE2C46A);
  static const Color goldDark = Color(0xFF9E7A2A);
  static const Color goldGlow = Color(0x33C9A84C);
  static const Color green = Color(0xFF2D6A4F);
  static const Color greenLight = Color(0xFF52B788);
  static const Color white = Color(0xFFF5EDD8);
  static const Color white80 = Color(0xCCF5EDD8);
  static const Color white60 = Color(0x99F5EDD8);
  static const Color white30 = Color(0x4DF5EDD8);
  static const Color white10 = Color(0x1AF5EDD8);
  static const Color white06 = Color(0x0FF5EDD8);
  static const Color divider = Color(0xFF1A2E1E);
  static const Color error = Color(0xFFCF6679);
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.gold,
        secondary: AppColors.greenLight,
        surface: AppColors.surface,
        error: AppColors.error,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 52,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
          letterSpacing: -0.5,
          height: 1.1,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
          height: 1.15,
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        headlineLarge: GoogleFonts.playfairDisplay(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        headlineSmall: GoogleFonts.playfairDisplay(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        bodyLarge: GoogleFonts.dmSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
        bodyMedium: GoogleFonts.dmSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.white60,
        ),
        bodySmall: GoogleFonts.dmSans(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.white60,
        ),
        labelLarge: GoogleFonts.dmSans(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
          letterSpacing: 1.5,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white06,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.white10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.white10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.gold, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        labelStyle: GoogleFonts.dmSans(fontSize: 14, color: AppColors.white60),
        hintStyle: GoogleFonts.dmSans(fontSize: 14, color: AppColors.white30),
      ),
    );
  }
}