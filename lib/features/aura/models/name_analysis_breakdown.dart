import 'rgb_delta.dart';

class NameAnalysisBreakdown {
  final String normalizedName;
  final int validLetterCount;
  final int vowelCount;
  final int consonantCount;
  final double vowelRatio;
  final RgbDelta letterScore;
  final RgbDelta vowelFeatureScore;
  final RgbDelta vowelRatioScore;
  final RgbDelta lengthScore;
  final RgbDelta turkishCharacterScore;
  final RgbDelta meaningScore;
  final RgbDelta weightedRawScore;
  final List<String> debugNotes;

  const NameAnalysisBreakdown({
    required this.normalizedName,
    required this.validLetterCount,
    required this.vowelCount,
    required this.consonantCount,
    required this.vowelRatio,
    required this.letterScore,
    required this.vowelFeatureScore,
    required this.vowelRatioScore,
    required this.lengthScore,
    required this.turkishCharacterScore,
    required this.meaningScore,
    required this.weightedRawScore,
    required this.debugNotes,
  });
}
