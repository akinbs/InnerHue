// Symbolic scoring axes for the aura calculation engine.
// These are not clinical dimensions — they exist only to drive the RGB formula.
class AxisDelta {
  final double activation;
  final double grounding;
  final double reflection;
  final double openness;
  final double threshold;

  const AxisDelta({
    required this.activation,
    required this.grounding,
    required this.reflection,
    required this.openness,
    required this.threshold,
  });

  const AxisDelta.zero()
      : activation = 0,
        grounding = 0,
        reflection = 0,
        openness = 0,
        threshold = 0;

  AxisDelta operator +(AxisDelta other) {
    return AxisDelta(
      activation: activation + other.activation,
      grounding: grounding + other.grounding,
      reflection: reflection + other.reflection,
      openness: openness + other.openness,
      threshold: threshold + other.threshold,
    );
  }

  @override
  String toString() =>
      'AxisDelta(A:$activation, G:$grounding, R:$reflection, O:$openness, T:$threshold)';
}
