import '../../../core/constants/app_constants.dart';
import '../../../core/utils/clamp_utils.dart';
import '../models/aura_seed.dart';
import '../models/axis_delta.dart';
import '../models/rgb_value.dart';
import 'seed_merge_engine.dart';
import 'story_score_engine.dart';

class AuraScoreEngine {
  const AuraScoreEngine._();

  // final = clamp(128 + seedDelta + storyDelta, 0, 255)
  static RgbValue compute({
    required AuraSeed seed,
    required AxisDelta storyAxis,
  }) {
    final seedDelta = SeedMergeEngine.merge(seed);
    final storyDelta = StoryScoreEngine.compute(storyAxis);
    final combined = seedDelta.add(storyDelta);

    return RgbValue(
      red: ClampUtils.clampRgbChannel(AppConstants.baseR + combined.red),
      green: ClampUtils.clampRgbChannel(AppConstants.baseG + combined.green),
      blue: ClampUtils.clampRgbChannel(AppConstants.baseB + combined.blue),
    );
  }
}
