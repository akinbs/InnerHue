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

    final rStory = (-82 * a - 30 * t + 25 * r - 13 * o).round();
    final gStory = (-78 * g - 25 * o - 21 * t + 21 * a).round();
    final bStory = (-87 * r - 30 * o + 25 * t - 9 * g).round();

    return RgbDelta(
      red: ClampUtils.clampInt(rStory, -AppConstants.storyDeltaClamp, AppConstants.storyDeltaClamp),
      green: ClampUtils.clampInt(gStory, -AppConstants.storyDeltaClamp, AppConstants.storyDeltaClamp),
      blue: ClampUtils.clampInt(bStory, -AppConstants.storyDeltaClamp, AppConstants.storyDeltaClamp),
    );
  }
}
