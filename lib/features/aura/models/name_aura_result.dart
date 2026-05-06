import 'name_analysis_breakdown.dart';
import 'name_meaning_tag.dart';
import 'rgb_delta.dart';

class NameAuraResult {
  final String originalName;
  final String normalizedName;
  final RgbDelta nameDelta;
  final List<NameMeaningTag> meaningTags;
  final NameAnalysisBreakdown breakdown;
  final String displayTitle;
  final String shortDescription;

  const NameAuraResult({
    required this.originalName,
    required this.normalizedName,
    required this.nameDelta,
    required this.meaningTags,
    required this.breakdown,
    required this.displayTitle,
    required this.shortDescription,
  });
}
