import 'package:flutter/material.dart';

class ColorUtils {
  const ColorUtils._();

  static String toHex(Color color) {
    final r = (color.r * 255.0).round().toRadixString(16).padLeft(2, '0').toUpperCase();
    final g = (color.g * 255.0).round().toRadixString(16).padLeft(2, '0').toUpperCase();
    final b = (color.b * 255.0).round().toRadixString(16).padLeft(2, '0').toUpperCase();
    return '#$r$g$b';
  }
}
