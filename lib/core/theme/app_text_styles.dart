import 'package:flutter/material.dart';

/// Centralized text styles using the app's custom fonts
class AppTextStyles {
  // Primary font family (Tajawal)
  static const String primaryFont = 'Tajawal';
  
  // Secondary font family (LamaSans) - can be used for special cases
  static const String secondaryFont = 'LamaSans';

  /// Get text style with primary font family
  static TextStyle withFont({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    String? fontFamily,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? primaryFont,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Display large text style
  static TextStyle displayLarge({Color? color}) {
    return withFont(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  /// Display medium text style
  static TextStyle displayMedium({Color? color}) {
    return withFont(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  /// Display small text style
  static TextStyle displaySmall({Color? color}) {
    return withFont(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  /// Headline medium text style
  static TextStyle headlineMedium({Color? color}) {
    return withFont(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  /// Title large text style
  static TextStyle titleLarge({Color? color}) {
    return withFont(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  /// Body large text style
  static TextStyle bodyLarge({Color? color}) {
    return withFont(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  /// Body medium text style
  static TextStyle bodyMedium({Color? color}) {
    return withFont(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  /// Button text style
  static TextStyle button({Color? color}) {
    return withFont(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
}
