import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_texts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/clamp_utils.dart';
import '../logic/seed_merge_engine.dart';
import '../models/aura_seed.dart';
import '../models/name_aura_result.dart';
import '../models/rgb_delta.dart';
import '../models/rgb_value.dart';
import '../models/zodiac_aura_result.dart';
import '../widgets/aura_preview_card.dart';
import '../widgets/name_analysis_debug_card.dart';
import '../widgets/rgb_debug_row.dart';
import '../widgets/zodiac_analysis_debug_card.dart';

class HomeScreen extends StatelessWidget {
  final NameAuraResult nameResult;
  final ZodiacAuraResult zodiacResult;

  const HomeScreen({
    super.key,
    required this.nameResult,
    required this.zodiacResult,
  });

  RgbValue _computeRgb() {
    // Step 3: name + zodiac seed merged; nationality/story still zero
    final seed = AuraSeed(
      nameDelta: nameResult.nameDelta,
      zodiacDelta: zodiacResult.zodiacDelta,
      nationalityDelta: const RgbDelta.zero(),
    );
    final seedDelta = SeedMergeEngine.merge(seed);
    return RgbValue(
      red: ClampUtils.clampRgbChannel(AppConstants.baseR + seedDelta.red),
      green: ClampUtils.clampRgbChannel(AppConstants.baseG + seedDelta.green),
      blue: ClampUtils.clampRgbChannel(AppConstants.baseB + seedDelta.blue),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rgb = _computeRgb();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(AppTexts.appName),
        iconTheme: const IconThemeData(color: AppColors.textSecondary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Spektrum Katmanların',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              AuraPreviewCard(rgbValue: rgb),
              const SizedBox(height: 20),
              RgbDebugRow(rgbValue: rgb),
              const SizedBox(height: 28),
              NameAnalysisDebugCard(result: nameResult),
              const SizedBox(height: 16),
              ZodiacAnalysisDebugCard(result: zodiacResult),
              const SizedBox(height: 28),
              Text(
                'Bu çıktı yalnızca isim ve burç katmanlarının teknik ön '
                'izlemesidir. Asıl aura hikaye seçimleriyle tamamlanacak.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
