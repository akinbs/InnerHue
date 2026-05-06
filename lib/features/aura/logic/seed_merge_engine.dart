import '../../../core/constants/app_constants.dart';
import '../../../core/utils/clamp_utils.dart';
import '../models/aura_seed.dart';
import '../models/rgb_delta.dart';

class SeedMergeEngine {
  const SeedMergeEngine._();

  static RgbDelta merge(AuraSeed seed) {
    return RgbDelta(
      red: _mergeChannel(
        seed.nameDelta.red,
        seed.zodiacDelta.red,
        seed.nationalityDelta.red,
      ),
      green: _mergeChannel(
        seed.nameDelta.green,
        seed.zodiacDelta.green,
        seed.nationalityDelta.green,
      ),
      blue: _mergeChannel(
        seed.nameDelta.blue,
        seed.zodiacDelta.blue,
        seed.nationalityDelta.blue,
      ),
    );
  }

  // seed_norm = 0.50*(name/35) + 0.30*(zodiac/30) + 0.20*(nationality/20)
  // seed_delta = round(24 * clamp(seed_norm, -1, 1))
  static int _mergeChannel(int name, int zodiac, int nationality) {
    final norm =
        AppConstants.nameWeight * (name / AppConstants.nameMaxDelta) +
        AppConstants.zodiacWeight * (zodiac / AppConstants.zodiacMaxDelta) +
        AppConstants.nationalityWeight *
            (nationality / AppConstants.nationalityMaxDelta);
    final clamped = ClampUtils.clampDouble(norm, -1.0, 1.0);
    return (AppConstants.seedFinalMax * clamped).round();
  }
}
