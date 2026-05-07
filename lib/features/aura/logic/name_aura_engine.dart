import 'dart:math' as math;

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/clamp_utils.dart';
import '../data/name_letter_score_map.dart';
import '../data/name_meaning_tag_map.dart';
import '../models/name_analysis_breakdown.dart';
import '../models/name_aura_result.dart';
import '../models/name_meaning_tag.dart';
import '../models/rgb_delta.dart';

class NameAuraEngine {
  const NameAuraEngine._();

  static const _vowels = {'a', 'e', 'ı', 'i', 'o', 'ö', 'u', 'ü'};
  static const _turkishSpecial = {'ç', 'ğ', 'ı', 'ö', 'ş', 'ü'};
  static const _validLetters = {
    'a', 'b', 'c', 'ç', 'd', 'e', 'f', 'g', 'ğ', 'h',
    'ı', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'ö', 'p',
    'r', 's', 'ş', 't', 'u', 'ü', 'v', 'y', 'z',
  };

  static NameAuraResult analyze(String input) {
    final normalized = _normalizeTurkishName(input);
    final tokens = normalized.split(' ').where((t) => t.isNotEmpty).toList();

    final allLetters = tokens
        .expand((t) => t.split(''))
        .where((c) => _validLetters.contains(c))
        .toList();

    final vowelCount = allLetters.where(_vowels.contains).length;
    final totalLetters = allLetters.length;
    final consonantCount = totalLetters - vowelCount;
    final vowelRatio = totalLetters > 0 ? vowelCount / totalLetters : 0.0;

    final letterScore = _calculateLetterScore(tokens);
    final vowelFeatureScore = _calculateVowelFeatureScore(allLetters);
    final vowelRatioScore = _calculateVowelRatioScore(vowelRatio);
    final lengthScore = _calculateLengthScore(totalLetters);
    final turkishCharacterScore = _calculateTurkishCharacterScore(allLetters);

    final firstToken = tokens.isNotEmpty ? tokens.first : '';
    final meaningTagIds = NameMeaningTagMap.nameTagMap[firstToken] ?? [];
    final meaningTags = _buildMeaningTags(meaningTagIds);
    final meaningScore = _calculateMeaningScore(meaningTagIds);

    final nameDelta = _computeWeightedDelta(
      letterScore: letterScore,
      vowelFeatureScore: vowelFeatureScore,
      vowelRatioScore: vowelRatioScore,
      lengthScore: lengthScore,
      turkishCharacterScore: turkishCharacterScore,
      meaningScore: meaningScore,
    );

    final notes = <String>[
      if (meaningTagIds.isEmpty) 'Bu isim için yerel anlam etiketi bulunamadı.',
      if (totalLetters <= 2) 'Çok kısa isim — harf skoru sınırlı.',
    ];

    final breakdown = NameAnalysisBreakdown(
      normalizedName: normalized,
      validLetterCount: totalLetters,
      vowelCount: vowelCount,
      consonantCount: consonantCount,
      vowelRatio: vowelRatio,
      letterScore: letterScore,
      vowelFeatureScore: vowelFeatureScore,
      vowelRatioScore: vowelRatioScore,
      lengthScore: lengthScore,
      turkishCharacterScore: turkishCharacterScore,
      meaningScore: meaningScore,
      weightedRawScore: nameDelta,
      debugNotes: notes,
    );

    final displayName = _toTitleCase(input.trim());

    return NameAuraResult(
      originalName: input.trim(),
      normalizedName: normalized,
      nameDelta: nameDelta,
      meaningTags: meaningTags,
      breakdown: breakdown,
      displayTitle: '$displayName için isim spektrumu',
      shortDescription:
          'İsmin, harf yapısı ve ses dokusu üzerinden spektrumuna '
          'sembolik bir başlangıç tohumu ekledi.',
    );
  }

  // Turkish-aware lowercase: I→ı, İ→i
  static String _normalizeTurkishName(String input) {
    final lowered = input
        .replaceAll('I', 'ı')
        .replaceAll('İ', 'i')
        .toLowerCase();
    return lowered.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  // First letter 1.30, last letter 1.15, others 1.00; single letter 1.30
  static double _posMultiplier(int index, int length) {
    if (length == 1) return 1.30;
    if (index == 0) return 1.30;
    if (index == length - 1) return 1.15;
    return 1.00;
  }

  static double _tokenWeight(int tokenIndex) {
    if (tokenIndex == 0) return 1.00;
    if (tokenIndex == 1) return 0.65;
    return 0.45;
  }

  // Accumulate letter scores weighted by position and token order
  static RgbDelta _calculateLetterScore(List<String> tokens) {
    double r = 0, g = 0, b = 0;

    for (int ti = 0; ti < tokens.length; ti++) {
      final tw = _tokenWeight(ti);
      final letters = tokens[ti]
          .split('')
          .where((c) => _validLetters.contains(c))
          .toList();

      for (int li = 0; li < letters.length; li++) {
        final pm = _posMultiplier(li, letters.length);
        final s = NameLetterScoreMap.scores[letters[li]];
        if (s != null) {
          r += s.$1 * pm * tw;
          g += s.$2 * pm * tw;
          b += s.$3 * pm * tw;
        }
      }
    }

    return RgbDelta(red: r.round(), green: g.round(), blue: b.round());
  }

  // Vowel harmony bonuses — each vowel may hit multiple categories
  static RgbDelta _calculateVowelFeatureScore(List<String> allLetters) {
    double r = 0, g = 0, b = 0;

    for (final c in allLetters) {
      if (!_vowels.contains(c)) continue;

      // Kalın/arka: a ı o u
      if (c == 'a' || c == 'ı' || c == 'o' || c == 'u') r -= 5;
      // İnce/ön: e i ö ü
      if (c == 'e' || c == 'i' || c == 'ö' || c == 'ü') b -= 5;
      // Yuvarlak: o ö u ü
      if (c == 'o' || c == 'ö' || c == 'u' || c == 'ü') g -= 5;
      // Düz — a,ı → R-3; e,i → B-3
      if (c == 'a' || c == 'ı') r -= 3;
      if (c == 'e' || c == 'i') b -= 3;
      // Geniş: a e o ö
      if (c == 'a' || c == 'e' || c == 'o' || c == 'ö') g -= 3;
      // Dar: ı i u ü
      if (c == 'ı' || c == 'i' || c == 'u' || c == 'ü') b -= 3;
    }

    return RgbDelta(red: r.round(), green: g.round(), blue: b.round());
  }

  static RgbDelta _calculateVowelRatioScore(double ratio) {
    if (ratio < 0.20) return const RgbDelta(red: -19, green: 0, blue: -12);
    if (ratio < 0.40) return const RgbDelta(red: -12, green: -8, blue: 0);
    if (ratio <= 0.60) return const RgbDelta(red: 0, green: -19, blue: 0);
    return const RgbDelta(red: 0, green: -12, blue: -16);
  }

  static RgbDelta _calculateLengthScore(int count) {
    if (count <= 1) return const RgbDelta(red: -9, green: 0, blue: -5);
    if (count <= 3) return const RgbDelta(red: -24, green: 0, blue: -5);
    if (count <= 5) return const RgbDelta(red: -14, green: -9, blue: 0);
    if (count <= 7) return const RgbDelta(red: 0, green: -18, blue: -8);
    if (count <= 10) return const RgbDelta(red: 0, green: -9, blue: -19);
    return const RgbDelta(red: -9, green: 0, blue: -24);
  }

  // Each special Turkish char contributes G+2, B+2 (capped at +8 each)
  static RgbDelta _calculateTurkishCharacterScore(List<String> allLetters) {
    final count = allLetters.where((c) => _turkishSpecial.contains(c)).length;
    final bonus = math.min(count * 5, 22);
    return RgbDelta(red: 0, green: -bonus, blue: -bonus);
  }

  static RgbDelta _calculateMeaningScore(List<String> tagIds) {
    int r = 0, g = 0, b = 0;
    for (final id in tagIds) {
      final s = NameMeaningTagMap.tagRgbMap[id];
      if (s != null) {
        r += s.$1;
        g += s.$2;
        b += s.$3;
      }
    }
    return RgbDelta(red: r, green: g, blue: b);
  }

  static List<NameMeaningTag> _buildMeaningTags(List<String> tagIds) {
    return tagIds.map((id) {
      final delta = NameMeaningTagMap.tagRgbMap[id];
      return NameMeaningTag(
        id: id,
        label: id,
        rgbDelta: delta != null
            ? RgbDelta(red: delta.$1, green: delta.$2, blue: delta.$3)
            : const RgbDelta.zero(),
      );
    }).toList();
  }

  // weightedRaw = letterScore*0.35 + vowelFeature*0.15 + vowelRatio*0.10
  //             + length*0.10 + turkishChar*0.05 + meaning*0.25
  // Clamped to ±AppConstants.nameMaxDelta per channel
  static RgbDelta _computeWeightedDelta({
    required RgbDelta letterScore,
    required RgbDelta vowelFeatureScore,
    required RgbDelta vowelRatioScore,
    required RgbDelta lengthScore,
    required RgbDelta turkishCharacterScore,
    required RgbDelta meaningScore,
  }) {
    int weighted(int ls, int vf, int vr, int len, int tc, int ms) =>
        (ls * 0.35 + vf * 0.15 + vr * 0.10 + len * 0.10 + tc * 0.05 + ms * 0.25)
            .round();

    final limit = AppConstants.nameMaxDelta.toInt();
    return RgbDelta(
      red: ClampUtils.clampInt(
        weighted(letterScore.red, vowelFeatureScore.red, vowelRatioScore.red,
            lengthScore.red, turkishCharacterScore.red, meaningScore.red),
        -limit, limit,
      ),
      green: ClampUtils.clampInt(
        weighted(letterScore.green, vowelFeatureScore.green, vowelRatioScore.green,
            lengthScore.green, turkishCharacterScore.green, meaningScore.green),
        -limit, limit,
      ),
      blue: ClampUtils.clampInt(
        weighted(letterScore.blue, vowelFeatureScore.blue, vowelRatioScore.blue,
            lengthScore.blue, turkishCharacterScore.blue, meaningScore.blue),
        -limit, limit,
      ),
    );
  }

  static String _toTitleCase(String s) {
    if (s.isEmpty) return s;
    return s.split(' ').map((word) {
      if (word.isEmpty) return word;
      final first = word[0].toUpperCase();
      return first + word.substring(1);
    }).join(' ');
  }
}
