import '../../../core/constants/app_constants.dart';
import '../../../core/utils/clamp_utils.dart';
import '../models/axis_delta.dart';
import '../models/rgb_delta.dart';

class StoryScoreEngine {
  const StoryScoreEngine._();

  // Normalizes raw axis scores and maps them to an RGB delta.
  // Each channel is clamped to ±72 before being applied to the base.
  static RgbDelta compute(AxisDelta raw) {
    final a = ClampUtils.clampDouble(
      raw.activation / AppConstants.activationMax, -1.0, 1.0,
    );
    final g = ClampUtils.clampDouble(
      raw.grounding / AppConstants.groundingMax, -1.0, 1.0,
    );
    final r = ClampUtils.clampDouble(
      raw.reflection / AppConstants.reflectionMax, -1.0, 1.0,
    );
    final o = ClampUtils.clampDouble(
      raw.openness / AppConstants.opennessMax, -1.0, 1.0,
    );
    final t = ClampUtils.clampDouble(
      raw.threshold / AppConstants.thresholdMax, -1.0, 1.0,
    );

    final rStory = (38 * a + 14 * t - 12 * r + 6 * o).round();
    final gStory = (36 * g + 12 * o + 10 * t - 10 * a).round();
    final bStory = (40 * r + 14 * o - 12 * t + 4 * g).round();

    return RgbDelta(
      red: ClampUtils.clampInt(rStory, -AppConstants.storyDeltaClamp, AppConstants.storyDeltaClamp),
      green: ClampUtils.clampInt(gStory, -AppConstants.storyDeltaClamp, AppConstants.storyDeltaClamp),
      blue: ClampUtils.clampInt(bStory, -AppConstants.storyDeltaClamp, AppConstants.storyDeltaClamp),
    );
  }
}
