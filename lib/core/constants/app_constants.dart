class AppConstants {
  const AppConstants._();

  static const int baseR = 128;
  static const int baseG = 128;
  static const int baseB = 128;

  static const double nameMaxDelta = 35.0;
  static const double zodiacMaxDelta = 30.0;
  static const double nationalityMaxDelta = 20.0;
  static const double seedFinalMax = 24.0;

  static const double nameWeight = 0.50;
  static const double zodiacWeight = 0.30;
  static const double nationalityWeight = 0.20;

  // Story axis normalization denominators
  static const double activationMax = 16.0;
  static const double groundingMax = 17.0;
  static const double reflectionMax = 21.0;
  static const double opennessMax = 16.0;
  static const double thresholdMax = 15.0;

  static const int storyDeltaClamp = 72;

  // Zodiac formula weights
  static const double zodiacElementWeight = 0.45;
  static const double zodiacModalityWeight = 0.20;
  static const double zodiacArchetypeWeight = 0.25;
  static const double zodiacPolarityWeight = 0.10;

  // Nationality formula weights and palette params
  static const double nationalityFlagPaletteWeight = 0.70;
  static const double nationalityContrastWeight = 0.15;
  static const double nationalityCodeVariationWeight = 0.15;
  static const double flagPaletteAmplitude = 16.0;
  static const double flagPaletteNormDivisor = 127.0;
}
