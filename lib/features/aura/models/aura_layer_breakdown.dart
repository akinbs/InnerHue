import 'rgb_delta.dart';
import 'rgb_value.dart';

class AuraLayerBreakdown {
  final RgbDelta nameDelta;
  final RgbDelta zodiacDelta;
  final RgbDelta nationalityDelta;
  final RgbDelta mergedSeedDelta;
  final RgbDelta storyDelta;
  final RgbValue finalRgb;
  final RgbValue baseRgb;

  const AuraLayerBreakdown({
    required this.nameDelta,
    required this.zodiacDelta,
    required this.nationalityDelta,
    required this.mergedSeedDelta,
    required this.storyDelta,
    required this.finalRgb,
    required this.baseRgb,
  });
}
