import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../models/aura_identity.dart';
import '../models/rgb_value.dart';
import '../models/story_aura_result.dart';

class AuraIdentityEngine {
  const AuraIdentityEngine._();

  static AuraIdentity build({
    required RgbValue finalRgb,
    required StoryAuraResult storyResult,
  }) {
    final r = finalRgb.red;
    final g = finalRgb.green;
    final b = finalRgb.blue;

    final dominant = _getDominantChannel(r, g, b);
    final secondary = _getSecondaryChannel(r, g, b, dominant);
    final colorFamily = _getColorFamily(dominant, secondary);
    final axisSuffix = _getAxisSuffix(storyResult.dominantAxis);
    final auraName = '$colorFamily $axisSuffix';
    final subtitle = _buildSubtitle(storyResult.dominantAxis);
    final intensity = _getIntensityLevel(r, g, b);
    final keywords = _getVisualKeywords(storyResult.dominantAxis);
    final gradients = _buildGradientColors(r, g, b);

    return AuraIdentity(
      auraName: auraName,
      auraSubtitle: subtitle,
      dominantColorFamily: colorFamily,
      dominantChannel: dominant,
      secondaryChannel: secondary,
      intensityLevel: intensity,
      visualKeywords: keywords,
      gradientColors: gradients,
    );
  }

  // ── Channel analysis ──────────────────────────────────────────────────────

  static String _getDominantChannel(int r, int g, int b) {
    final maxVal = _max3(r, g, b);
    final minVal = _min3(r, g, b);

    if (maxVal - minVal < AppConstants.balancedChannelThreshold) return 'balanced';

    if (r == maxVal) return 'red';
    if (g == maxVal) return 'green';
    return 'blue';
  }

  static String? _getSecondaryChannel(
      int r, int g, int b, String dominant) {
    if (dominant == 'balanced') return null;

    final dominantVal =
        dominant == 'red' ? r : (dominant == 'green' ? g : b);

    final others = <MapEntry<String, int>>[
      if (dominant != 'red') MapEntry('red', r),
      if (dominant != 'green') MapEntry('green', g),
      if (dominant != 'blue') MapEntry('blue', b),
    ]..sort((a, b_) => b_.value.compareTo(a.value));

    if (others.isNotEmpty &&
        dominantVal - others[0].value < AppConstants.dualChannelThreshold) {
      return others[0].key;
    }
    return null;
  }

  // ── Name generation ───────────────────────────────────────────────────────

  static String _getColorFamily(String dominant, String? secondary) {
    switch (dominant) {
      case 'red':
        if (secondary == 'green') return 'Amber';
        if (secondary == 'blue') return 'Crimson Violet';
        return 'Crimson';
      case 'green':
        if (secondary == 'red') return 'Golden Grove';
        if (secondary == 'blue') return 'Emerald Tide';
        return 'Emerald';
      case 'blue':
        if (secondary == 'red') return 'Violet Current';
        if (secondary == 'green') return 'Ocean Bloom';
        return 'Azure';
      case 'balanced':
        return 'Soft Prism';
      default:
        return 'Prism';
    }
  }

  static String _getAxisSuffix(String dominantAxis) {
    switch (dominantAxis) {
      case 'activation':
        return 'Spark';
      case 'grounding':
        return 'Root';
      case 'reflection':
        return 'Mirror';
      case 'openness':
        return 'Horizon';
      case 'threshold':
        return 'Gate';
      case 'balanced':
        return 'Halo';
      default:
        return 'Halo';
    }
  }

  // ── Subtitle ──────────────────────────────────────────────────────────────

  static String _buildSubtitle(String dominantAxis) {
    switch (dominantAxis) {
      case 'activation':
        return 'Hareket ve sıcaklık taşıyan sembolik spektrum';
      case 'grounding':
        return 'Zemin ve denge hissi taşıyan sembolik spektrum';
      case 'reflection':
        return 'Yansıma ve derinlik hissi taşıyan sembolik spektrum';
      case 'openness':
        return 'Açıklık ve ufuk hissi taşıyan sembolik spektrum';
      case 'threshold':
        return 'Eşik ve geçiş hissi taşıyan sembolik spektrum';
      case 'balanced':
        return 'Dengeli bir ton geçişi taşıyan sembolik spektrum';
      default:
        return 'Sembolik bir renk spektrumu';
    }
  }

  // ── Intensity ─────────────────────────────────────────────────────────────

  static String _getIntensityLevel(int r, int g, int b) {
    final brightness = (r + g + b) / 3.0;
    if (brightness < AppConstants.intensityDeepMax) return 'Derin';
    if (brightness < AppConstants.intensityYogunMax) return 'Yoğun';
    if (brightness < AppConstants.intensityCanliMax) return 'Canlı';
    return 'Parlak';
  }

  // ── Visual keywords ───────────────────────────────────────────────────────

  static List<String> _getVisualKeywords(String dominantAxis) {
    switch (dominantAxis) {
      case 'activation':
        return ['Hareket', 'Enerji', 'İlk Adım'];
      case 'grounding':
        return ['Zemin', 'Temas', 'Denge'];
      case 'reflection':
        return ['Yansıma', 'Derinlik', 'Sessizlik'];
      case 'openness':
        return ['Açıklık', 'Merak', 'Ufuk'];
      case 'threshold':
        return ['Eşik', 'Geçiş', 'Karar'];
      case 'balanced':
        return ['Denge', 'Bütünlük', 'Uyum'];
      default:
        return ['Sembolik', 'Spektrum', 'Renk'];
    }
  }

  // ── Gradient colors ───────────────────────────────────────────────────────

  static List<Color> _buildGradientColors(int r, int g, int b) {
    final rD = r.toDouble();
    final gD = g.toDouble();
    final bD = b.toDouble();

    final lighter = Color.fromARGB(
      220,
      (rD + (255.0 - rD) * 0.35).round().clamp(0, 255),
      (gD + (255.0 - gD) * 0.35).round().clamp(0, 255),
      (bD + (255.0 - bD) * 0.35).round().clamp(0, 255),
    );
    final primary = Color.fromARGB(255, r, g, b);
    final darker = Color.fromARGB(
      200,
      (rD * 0.50).round().clamp(0, 255),
      (gD * 0.50).round().clamp(0, 255),
      (bD * 0.50).round().clamp(0, 255),
    );
    return [lighter, primary, darker];
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  static int _max3(int a, int b, int c) =>
      a >= b && a >= c ? a : (b >= c ? b : c);

  static int _min3(int a, int b, int c) =>
      a <= b && a <= c ? a : (b <= c ? b : c);
}
