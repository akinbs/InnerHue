import '../../../core/utils/clamp_utils.dart';

class RgbDelta {
  final int red;
  final int green;
  final int blue;

  const RgbDelta({
    required this.red,
    required this.green,
    required this.blue,
  });

  const RgbDelta.zero()
      : red = 0,
        green = 0,
        blue = 0;

  RgbDelta add(RgbDelta other) {
    return RgbDelta(
      red: red + other.red,
      green: green + other.green,
      blue: blue + other.blue,
    );
  }

  RgbDelta scale(double factor) {
    return RgbDelta(
      red: (red * factor).round(),
      green: (green * factor).round(),
      blue: (blue * factor).round(),
    );
  }

  RgbDelta clamp({int min = -255, int max = 255}) {
    return RgbDelta(
      red: ClampUtils.clampInt(red, min, max),
      green: ClampUtils.clampInt(green, min, max),
      blue: ClampUtils.clampInt(blue, min, max),
    );
  }

  @override
  String toString() => 'RgbDelta(dR:$red, dG:$green, dB:$blue)';
}
