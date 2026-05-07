import 'axis_delta.dart';

class AuraOption {
  final String id;
  final String label;
  final AxisDelta axisDelta;
  final String? debugNote;
  final List<String>? tags;

  const AuraOption({
    required this.id,
    required this.label,
    required this.axisDelta,
    this.debugNote,
    this.tags,
  });
}
