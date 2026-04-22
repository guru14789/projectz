import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();

  static const Color black   = Color(0xFF000000);
  static const Color white   = Color(0xFFFFFFFF);
  static const Color grayBg  = Color(0xFFF5F5F5);
  static const Color grayBorder = Color(0xFFE5E5E5);
  
  // High contrast sketch colors
  static const Color accent  = Color(0xFF000000);
  static const Color subtle  = Color(0xFF757575);
}

class AppTextStyles {
  AppTextStyles._();

  static final TextStyle displayLarge = GoogleFonts.outfit(
    fontSize: 40, fontWeight: FontWeight.w900, color: AppColors.black, height: 1.1,
  );
  static final TextStyle headingLarge = GoogleFonts.outfit(
    fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.black,
  );
  static final TextStyle headingMedium = GoogleFonts.outfit(
    fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.black,
  );
  static final TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black, height: 1.5,
  );
  static final TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.subtle,
  );
  static final TextStyle labelBold = GoogleFonts.inter(
    fontSize: 13, fontWeight: FontWeight.w800, color: AppColors.black, letterSpacing: 0.5,
  );
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColors.black,
      onPrimary: AppColors.white,
      surface: AppColors.white,
      background: AppColors.grayBg,
    ),
    fontFamily: GoogleFonts.outfit().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: AppColors.black),
    ),
  );
}
