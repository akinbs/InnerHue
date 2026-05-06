import 'rgb_delta.dart';
import 'zodiac_sign.dart';

class ZodiacAuraResult {
  final DateTime birthDate;
  final ZodiacSign primarySign;
  final ZodiacSign? blendedSign;
  final double primaryWeight;
  final double blendedWeight;
  final RgbDelta elementDelta;
  final RgbDelta modalityDelta;
  final RgbDelta archetypeDelta;
  final RgbDelta polarityDelta;
  final RgbDelta zodiacDelta;
  final bool isCusp;
  final String displayTitle;
  final String shortDescription;
  final List<String> debugNotes;

  const ZodiacAuraResult({
    required this.birthDate,
    required this.primarySign,
    this.blendedSign,
    required this.primaryWeight,
    required this.blendedWeight,
    required this.elementDelta,
    required this.modalityDelta,
    required this.archetypeDelta,
    required this.polarityDelta,
    required this.zodiacDelta,
    required this.isCusp,
    required this.displayTitle,
    required this.shortDescription,
    required this.debugNotes,
  });
}
