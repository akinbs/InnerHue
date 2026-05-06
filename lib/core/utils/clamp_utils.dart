class ClampUtils {
  const ClampUtils._();

  static double clampDouble(double value, double min, double max) {
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }

  static int clampInt(int value, int min, int max) {
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }

  static int clampRgbChannel(int value) => clampInt(value, 0, 255);
}
