import 'package:flutter/material.dart';
import '../../../core/utils/clamp_utils.dart';
import '../../../core/utils/color_utils.dart';
import 'rgb_delta.dart';

class RgbValue {
  final int red;
  final int green;
  final int blue;

  const RgbValue({
    required this.red,
    required this.green,
    required this.blue,
  });

  const RgbValue.base() : red = 128, green = 128, blue = 128;

  factory RgbValue.fromDelta({
    required RgbValue base,
    required RgbDelta delta,
  }) {
    return RgbValue(
      red: ClampUtils.clampRgbChannel(base.red + delta.red),
      green: ClampUtils.clampRgbChannel(base.green + delta.green),
      blue: ClampUtils.clampRgbChannel(base.blue + delta.blue),
    );
  }

  Color toColor() => Color.fromARGB(255, red, green, blue);

  String toHex() => ColorUtils.toHex(toColor());

  RgbValue copyWith({int? red, int? green, int? blue}) {
    return RgbValue(
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
    );
  }

  @override
  String toString() => 'RgbValue(R:$red, G:$green, B:$blue)';
}
