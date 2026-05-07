import 'aura_identity.dart';
import 'aura_layer_breakdown.dart';
import 'rgb_delta.dart';
import 'rgb_value.dart';

class FinalAuraResult {
  final RgbValue finalRgb;
  final String finalHex;
  final RgbDelta mergedSeedDelta;
  final RgbDelta storyDelta;
  final AuraIdentity auraIdentity;
  final String interpretation;
  final AuraLayerBreakdown layerBreakdown;
  final DateTime createdAt;

  FinalAuraResult({
    required this.finalRgb,
    required this.finalHex,
    required this.mergedSeedDelta,
    required this.storyDelta,
    required this.auraIdentity,
    required this.interpretation,
    required this.layerBreakdown,
    required this.createdAt,
  });
}
