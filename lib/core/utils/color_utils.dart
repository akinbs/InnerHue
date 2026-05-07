import 'package:flutter/material.dart';

class ColorUtils {
  const ColorUtils._();

  static String toHex(Color color) {
    final r = (color.r * 255.0).round().toRadixString(16).padLeft(2, '0').toUpperCase();
    final g = (color.g * 255.0).round().toRadixString(16).padLeft(2, '0').toUpperCase();
    final b = (color.b * 255.0).round().toRadixString(16).padLeft(2, '0').toUpperCase();
    return '#$r$g$b';
  }

  static Color lightenColor(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  static Color darkenColor(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  static Color getReadableTextColor(Color background) {
    return background.computeLuminance() > 0.45
        ? const Color(0xDD000000)
        : const Color(0xFFFFFFFF);
  }
}
