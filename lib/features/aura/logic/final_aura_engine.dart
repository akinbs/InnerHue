import '../../../core/constants/app_constants.dart';
import '../../../core/utils/clamp_utils.dart';
import '../../../core/utils/color_utils.dart';
import '../models/aura_layer_breakdown.dart';
import '../models/aura_seed.dart';
import '../models/final_aura_result.dart';
import '../models/name_aura_result.dart';
import '../models/nationality_aura_result.dart';
import '../models/rgb_value.dart';
import '../models/story_aura_result.dart';
import '../models/zodiac_aura_result.dart';
import 'aura_identity_engine.dart';
import 'aura_interpretation_engine.dart';
import 'seed_merge_engine.dart';

class FinalAuraEngine {
  const FinalAuraEngine._();

  static FinalAuraResult build({
    required NameAuraResult nameResult,
    required ZodiacAuraResult zodiacResult,
    required NationalityAuraResult nationalityResult,
    required StoryAuraResult storyResult,
  }) {
    final name       = nameResult.nameDelta;
    final zodiac     = zodiacResult.zodiacDelta;
    final nationality = nationalityResult.nationalityDelta;
    final story      = storyResult.storyDelta;

    // Final RGB: 4 katmanın ham deltaları doğrudan toplanır
    // 128 + nameDelta + zodiacDelta + nationalityDelta + storyDelta
    final finalRgb = RgbValue(
      red: ClampUtils.clampRgbChannel(
        AppConstants.baseR + name.red + zodiac.red + nationality.red + story.red,
      ),
      green: ClampUtils.clampRgbChannel(
        AppConstants.baseG + name.green + zodiac.green + nationality.green + story.green,
      ),
      blue: ClampUtils.clampRgbChannel(
        AppConstants.baseB + name.blue + zodiac.blue + nationality.blue + story.blue,
      ),
    );

    final finalHex = ColorUtils.toHex(finalRgb.toColor());

    // mergedSeedDelta sadece teknik detay gösterimi için hesaplanır
    final seed = AuraSeed(
      nameDelta: name,
      zodiacDelta: zodiac,
      nationalityDelta: nationality,
    );
    final mergedSeedDelta = SeedMergeEngine.merge(seed);

    final identity = AuraIdentityEngine.build(
      finalRgb: finalRgb,
      storyResult: storyResult,
    );

    final interpretation = AuraInterpretationEngine.build(
      identity: identity,
      storyResult: storyResult,
    );

    final breakdown = AuraLayerBreakdown(
      nameDelta: name,
      zodiacDelta: zodiac,
      nationalityDelta: nationality,
      mergedSeedDelta: mergedSeedDelta,
      storyDelta: story,
      finalRgb: finalRgb,
      baseRgb: const RgbValue.base(),
    );

    return FinalAuraResult(
      finalRgb: finalRgb,
      finalHex: finalHex,
      mergedSeedDelta: mergedSeedDelta,
      storyDelta: story,
      auraIdentity: identity,
      interpretation: interpretation,
      layerBreakdown: breakdown,
      createdAt: DateTime.now(),
    );
  }
}
