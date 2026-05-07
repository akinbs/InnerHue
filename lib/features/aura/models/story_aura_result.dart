import 'axis_delta.dart';
import 'rgb_delta.dart';

class StoryAuraResult {
  final List<String> selectedOptionIds;
  final AxisDelta accumulatedAxisDelta;
  final double normalizedActivation;
  final double normalizedGrounding;
  final double normalizedReflection;
  final double normalizedOpenness;
  final double normalizedThreshold;
  final RgbDelta storyDelta;
  final String dominantAxis;
  final String displayTitle;
  final String shortDescription;
  final List<String> debugNotes;

  const StoryAuraResult({
    required this.selectedOptionIds,
    required this.accumulatedAxisDelta,
    required this.normalizedActivation,
    required this.normalizedGrounding,
    required this.normalizedReflection,
    required this.normalizedOpenness,
    required this.normalizedThreshold,
    required this.storyDelta,
    required this.dominantAxis,
    required this.displayTitle,
    required this.shortDescription,
    required this.debugNotes,
  });
}
