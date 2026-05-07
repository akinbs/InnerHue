import '../../../core/constants/app_constants.dart';
import '../../../core/utils/clamp_utils.dart';
import '../data/zodiac_signs_data.dart';
import '../models/rgb_delta.dart';
import '../models/zodiac_aura_result.dart';
import '../models/zodiac_enums.dart';
import '../models/zodiac_sign.dart';

class ZodiacAuraEngine {
  const ZodiacAuraEngine._();

  static ZodiacAuraResult analyze(DateTime birthDate) {
    final mmdd = birthDate.month * 100 + birthDate.day;
    final primary = _findSignByMmdd(mmdd);

    final elementDelta = _getElementDelta(primary.element);
    final modalityDelta = _getModalityDelta(primary.modality);
    final polarityDelta = _getPolarityDelta(primary.polarity);
    final primaryDelta = _computeBaseDelta(primary);

    ZodiacSign? blendedSign;
    double primaryWeight = 1.0;
    double blendedWeight = 0.0;
    bool isCusp = false;
    RgbDelta finalDelta = primaryDelta;
    final notes = <String>[];

    if (_isFirstTwoDays(mmdd, primary)) {
      blendedSign = _getPreviousSign(primary);
      primaryWeight = 0.75;
      blendedWeight = 0.25;
      isCusp = true;
      finalDelta = _blend(primaryDelta, 0.75, _computeBaseDelta(blendedSign), 0.25);
      notes.add('Geçiş başlangıcı — ${blendedSign.name} ile %25 harmanlı.');
    } else if (_isLastTwoDays(mmdd, primary)) {
      blendedSign = _getNextSign(primary);
      primaryWeight = 0.75;
      blendedWeight = 0.25;
      isCusp = true;
      finalDelta = _blend(primaryDelta, 0.75, _computeBaseDelta(blendedSign), 0.25);
      notes.add('Geçiş sonu — ${blendedSign.name} ile %25 harmanlı.');
    }

    return ZodiacAuraResult(
      birthDate: birthDate,
      primarySign: primary,
      blendedSign: blendedSign,
      primaryWeight: primaryWeight,
      blendedWeight: blendedWeight,
      elementDelta: elementDelta,
      modalityDelta: modalityDelta,
      archetypeDelta: primary.archetypeDelta,
      polarityDelta: polarityDelta,
      zodiacDelta: finalDelta,
      isCusp: isCusp,
      displayTitle: '${primary.name} katmanın eklendi',
      shortDescription: isCusp
          ? 'Doğum tarihin burç geçiş aralığına yakın olduğu için '
            'spektrumuna komşu burçtan hafif bir ton karıştı.'
          : 'Doğum tarihin, spektrumuna sembolik bir burç filtresi ekledi.',
      debugNotes: notes,
    );
  }

  // Weighted formula: element*0.45 + modality*0.20 + archetype*0.25 + polarity*0.10
  static RgbDelta _computeBaseDelta(ZodiacSign sign) {
    final e = _getElementDelta(sign.element);
    final m = _getModalityDelta(sign.modality);
    final a = sign.archetypeDelta;
    final p = _getPolarityDelta(sign.polarity);

    final limit = AppConstants.zodiacMaxDelta.toInt();

    int w(int ev, int mv, int av, int pv) =>
        (ev * AppConstants.zodiacElementWeight +
            mv * AppConstants.zodiacModalityWeight +
            av * AppConstants.zodiacArchetypeWeight +
            pv * AppConstants.zodiacPolarityWeight)
            .round();

    return RgbDelta(
      red: ClampUtils.clampInt(w(e.red, m.red, a.red, p.red), -limit, limit),
      green: ClampUtils.clampInt(w(e.green, m.green, a.green, p.green), -limit, limit),
      blue: ClampUtils.clampInt(w(e.blue, m.blue, a.blue, p.blue), -limit, limit),
    );
  }

  static RgbDelta _blend(
      RgbDelta primary, double pw, RgbDelta blended, double bw) {
    final limit = AppConstants.zodiacMaxDelta.toInt();
    int b(int pv, int bv) => (pv * pw + bv * bw).round();
    return RgbDelta(
      red: ClampUtils.clampInt(b(primary.red, blended.red), -limit, limit),
      green: ClampUtils.clampInt(b(primary.green, blended.green), -limit, limit),
      blue: ClampUtils.clampInt(b(primary.blue, blended.blue), -limit, limit),
    );
  }

  // MMDD = month * 100 + day; Capricorn spans year boundary (>=1222 or <=119)
  static ZodiacSign _findSignByMmdd(int mmdd) {
    final s = ZodiacSignsData.signs;
    if (mmdd >= 321 && mmdd <= 419) return s[0];   // Aries
    if (mmdd >= 420 && mmdd <= 520) return s[1];   // Taurus
    if (mmdd >= 521 && mmdd <= 621) return s[2];   // Gemini
    if (mmdd >= 622 && mmdd <= 722) return s[3];   // Cancer
    if (mmdd >= 723 && mmdd <= 822) return s[4];   // Leo
    if (mmdd >= 823 && mmdd <= 922) return s[5];   // Virgo
    if (mmdd >= 923 && mmdd <= 1023) return s[6];  // Libra
    if (mmdd >= 1024 && mmdd <= 1121) return s[7]; // Scorpio
    if (mmdd >= 1122 && mmdd <= 1221) return s[8]; // Sagittarius
    if (mmdd >= 1222 || mmdd <= 119) return s[9];  // Capricorn
    if (mmdd >= 120 && mmdd <= 218) return s[10];  // Aquarius
    return s[11];                                   // Pisces (219-320)
  }

  // Cusp = first or last 2 days of a sign's range.
  // Uses integer MMDD arithmetic — safe because no sign starts/ends on day 31.
  static bool _isFirstTwoDays(int mmdd, ZodiacSign sign) {
    final startMmdd = sign.startMonth * 100 + sign.startDay;
    return mmdd == startMmdd || mmdd == startMmdd + 1;
  }

  static bool _isLastTwoDays(int mmdd, ZodiacSign sign) {
    final endMmdd = sign.endMonth * 100 + sign.endDay;
    return mmdd == endMmdd || mmdd == endMmdd - 1;
  }

  static ZodiacSign _getPreviousSign(ZodiacSign sign) {
    final signs = ZodiacSignsData.signs;
    final idx = signs.indexWhere((s) => s.id == sign.id);
    return signs[(idx - 1 + signs.length) % signs.length];
  }

  static ZodiacSign _getNextSign(ZodiacSign sign) {
    final signs = ZodiacSignsData.signs;
    final idx = signs.indexWhere((s) => s.id == sign.id);
    return signs[(idx + 1) % signs.length];
  }

  static RgbDelta _getElementDelta(ZodiacElement element) => switch (element) {
        ZodiacElement.fire  => const RgbDelta(red: -66, green:  -8, blue:  20),
        ZodiacElement.earth => const RgbDelta(red:  -8, green: -66, blue:  -8),
        ZodiacElement.air   => const RgbDelta(red: -10, green: -16, blue: -65),
        ZodiacElement.water => const RgbDelta(red:  18, green: -16, blue: -72),
      };

  static RgbDelta _getModalityDelta(ZodiacModality modality) =>
      switch (modality) {
        ZodiacModality.cardinal => const RgbDelta(red: -27, green:  -5, blue:  -5),
        ZodiacModality.fixed    => const RgbDelta(red:  -9, green: -27, blue:  -5),
        ZodiacModality.mutable  => const RgbDelta(red:  -5, green:  -9, blue: -27),
      };

  static RgbDelta _getPolarityDelta(ZodiacPolarity polarity) =>
      switch (polarity) {
        ZodiacPolarity.active     => const RgbDelta(red: -14, green:   0, blue:  -9),
        ZodiacPolarity.reflective => const RgbDelta(red:   0, green: -14, blue:  -9),
      };
}
