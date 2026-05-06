import 'rgb_delta.dart';
import 'rgb_value.dart';

class NationalityAuraResult {
  final String countryCode;
  final String countryName;
  final RgbValue weightedFlagRgb;
  final RgbDelta flagPaletteDelta;
  final RgbDelta contrastDelta;
  final RgbDelta countryCodeVariationDelta;
  final RgbDelta nationalityDelta;
  final double contrastScore;
  final String displayTitle;
  final String shortDescription;
  final List<String> debugNotes;

  const NationalityAuraResult({
    required this.countryCode,
    required this.countryName,
    required this.weightedFlagRgb,
    required this.flagPaletteDelta,
    required this.contrastDelta,
    required this.countryCodeVariationDelta,
    required this.nationalityDelta,
    required this.contrastScore,
    required this.displayTitle,
    required this.shortDescription,
    required this.debugNotes,
  });
}
