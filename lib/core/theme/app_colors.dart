import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  // ── Backgrounds ────────────────────────────────────────────
  static const Color background = Color(0xFF090A12);
  static const Color surfaceSecondary = Color(0xFF10121D);
  static const Color surface = Color(0xFF151827);
  static const Color surfaceElevated = Color(0xFF1B1F33);

  // ── Neon accents ───────────────────────────────────────────
  static const Color primaryNeon = Color(0xFF8F5CFF);
  static const Color secondaryNeon = Color(0xFF00D4FF);

  // ── Warm & soft accents ────────────────────────────────────
  static const Color warmAccent = Color(0xFFFFB86B);
  static const Color softViolet = Color(0xFFBFA7FF);

  // ── Text ───────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFFF5F7FF);
  static const Color textSecondary = Color(0xFFA7ADC6);
  static const Color textMuted = Color(0xFF6F768E);

  // ── Borders ────────────────────────────────────────────────
  static const Color borderSubtle = Color(0xFF2A2F45);

  // ── Semantic ───────────────────────────────────────────────
  static const Color success = Color(0xFF64E6A3);
  static const Color warning = Color(0xFFFFCF6E);
  static const Color error = Color(0xFFFF5C7A);

  // ── RGB channel display ────────────────────────────────────
  static const Color rgbRed = Color(0xFFFF6B6B);
  static const Color rgbGreen = Color(0xFF6BFF9E);

  // ── Legacy alias ───────────────────────────────────────────
  static const Color tertiaryNeon = warmAccent;
}
