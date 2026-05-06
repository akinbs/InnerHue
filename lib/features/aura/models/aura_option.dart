import 'axis_delta.dart';

class AuraOption {
  final String id;
  final String label;
  final AxisDelta axisDelta;
  final String? debugNote;

  const AuraOption({
    required this.id,
    required this.label,
    required this.axisDelta,
    this.debugNote,
  });
}
