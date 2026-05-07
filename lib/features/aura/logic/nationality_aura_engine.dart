import '../../../core/constants/app_constants.dart';
import '../../../core/utils/clamp_utils.dart';
import '../models/country_aura_profile.dart';
import '../models/nationality_aura_result.dart';
import '../models/rgb_delta.dart';
import '../models/rgb_value.dart';

class NationalityAuraEngine {
  const NationalityAuraEngine._();

  static NationalityAuraResult analyze(CountryAuraProfile profile) {
    final weighted = _computeWeightedRgb(profile);
    final paletteDelta = _computeFlagPaletteDelta(weighted);
    final contrastScore = _computeContrastScore(profile);
    final contrastDelta = _computeContrastDelta(contrastScore);
    final codeVarDelta = _computeCodeVariationDelta(profile.countryCode);

    final rawR = paletteDelta.red * AppConstants.nationalityFlagPaletteWeight +
        contrastDelta.red * AppConstants.nationalityContrastWeight +
        codeVarDelta.red * AppConstants.nationalityCodeVariationWeight;
    final rawG = paletteDelta.green * AppConstants.nationalityFlagPaletteWeight +
        contrastDelta.green * AppConstants.nationalityContrastWeight +
        codeVarDelta.green * AppConstants.nationalityCodeVariationWeight;
    final rawB = paletteDelta.blue * AppConstants.nationalityFlagPaletteWeight +
        contrastDelta.blue * AppConstants.nationalityContrastWeight +
        codeVarDelta.blue * AppConstants.nationalityCodeVariationWeight;

    const maxDelta = 55;
    final nationalityDelta = RgbDelta(
      red: ClampUtils.clampInt(rawR.round(), -maxDelta, maxDelta),
      green: ClampUtils.clampInt(rawG.round(), -maxDelta, maxDelta),
      blue: ClampUtils.clampInt(rawB.round(), -maxDelta, maxDelta),
    );

    return NationalityAuraResult(
      countryCode: profile.countryCode,
      countryName: profile.countryName,
      weightedFlagRgb: weighted,
      flagPaletteDelta: paletteDelta,
      contrastDelta: contrastDelta,
      countryCodeVariationDelta: codeVarDelta,
      nationalityDelta: nationalityDelta,
      contrastScore: contrastScore,
      displayTitle: 'Bayrak Renk İmzası',
      shortDescription:
          '${profile.countryName} bayrağının ağırlıklı renk paleti bu imzayı oluşturdu.',
      debugNotes: _buildDebugNotes(
        weighted: weighted,
        paletteDelta: paletteDelta,
        contrastScore: contrastScore,
        contrastDelta: contrastDelta,
        codeVarDelta: codeVarDelta,
      ),
    );
  }

  static RgbValue _computeWeightedRgb(CountryAuraProfile profile) {
    double r = 0, g = 0, b = 0;
    for (final c in profile.flagColors) {
      r += c.red * c.weight;
      g += c.green * c.weight;
      b += c.blue * c.weight;
    }
    return RgbValue(red: r.round(), green: g.round(), blue: b.round());
  }

  static RgbDelta _computeFlagPaletteDelta(RgbValue weighted) {
    final norm = AppConstants.flagPaletteNormDivisor;
    final amp = AppConstants.flagPaletteAmplitude;
    return RgbDelta(
      red: ((128 - weighted.red) / norm * amp).round(),
      green: ((128 - weighted.green) / norm * amp).round(),
      blue: ((128 - weighted.blue) / norm * amp).round(),
    );
  }

  static double _computeContrastScore(CountryAuraProfile profile) {
    double maxLum = 0;
    double minLum = double.infinity;
    for (final c in profile.flagColors) {
      final lum = 0.299 * c.red + 0.587 * c.green + 0.114 * c.blue;
      if (lum > maxLum) maxLum = lum;
      if (lum < minLum) minLum = lum;
    }
    return maxLum - minLum;
  }

  static RgbDelta _computeContrastDelta(double contrastScore) {
    if (contrastScore < 80) {
      return const RgbDelta(red: 0, green: -3, blue: 0);
    } else if (contrastScore < 160) {
      return const RgbDelta(red: -2, green: -2, blue: 0);
    } else {
      return const RgbDelta(red: -3, green: 0, blue: -3);
    }
  }

  // Deterministic micro-variation so identical flag palettes differ by code
  static RgbDelta _computeCodeVariationDelta(String code) {
    int sum = 0;
    int productLike = 0;
    for (int i = 0; i < code.length; i++) {
      final unit = code.codeUnitAt(i);
      sum += unit;
      productLike += unit * (i + 1);
    }
    return RgbDelta(
      red: 4 - (sum * 3 + productLike) % 9,
      green: 4 - (sum * 5 + productLike * 2) % 9,
      blue: 4 - (sum * 7 + productLike * 3) % 9,
    );
  }

  static List<String> _buildDebugNotes({
    required RgbValue weighted,
    required RgbDelta paletteDelta,
    required double contrastScore,
    required RgbDelta contrastDelta,
    required RgbDelta codeVarDelta,
  }) {
    String s(int v) => v >= 0 ? '+$v' : '$v';
    return [
      'Ağırlıklı bayrak RGB: R${weighted.red} G${weighted.green} B${weighted.blue}',
      'Kontrast skoru: ${contrastScore.toStringAsFixed(1)}',
      'Palet delta (×0.70): R${s(paletteDelta.red)} G${s(paletteDelta.green)} B${s(paletteDelta.blue)}',
      'Kontrast delta (×0.15): R${s(contrastDelta.red)} G${s(contrastDelta.green)} B${s(contrastDelta.blue)}',
      'Kod varyasyonu (×0.15): R${s(codeVarDelta.red)} G${s(codeVarDelta.green)} B${s(codeVarDelta.blue)}',
    ];
  }
}
