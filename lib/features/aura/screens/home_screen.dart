import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_texts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/clamp_utils.dart';
import '../models/name_aura_result.dart';
import '../models/nationality_aura_result.dart';
import '../models/rgb_value.dart';
import '../models/story_aura_result.dart';
import '../models/zodiac_aura_result.dart';
import '../widgets/aura_preview_card.dart';
import '../widgets/name_analysis_debug_card.dart';
import '../widgets/nationality_analysis_debug_card.dart';
import '../widgets/rgb_debug_row.dart';
import '../widgets/story_analysis_debug_card.dart';
import '../widgets/zodiac_analysis_debug_card.dart';

class HomeScreen extends StatelessWidget {
  final NameAuraResult nameResult;
  final ZodiacAuraResult zodiacResult;
  final NationalityAuraResult nationalityResult;
  final StoryAuraResult storyResult;

  const HomeScreen({
    super.key,
    required this.nameResult,
    required this.zodiacResult,
    required this.nationalityResult,
    required this.storyResult,
  });

  RgbValue _computeRgb() {
    final name        = nameResult.nameDelta;
    final zodiac      = zodiacResult.zodiacDelta;
    final nationality = nationalityResult.nationalityDelta;
    final story       = storyResult.storyDelta;

    return RgbValue(
      red: ClampUtils.clampRgbChannel(
        AppConstants.baseR + name.red + zodiac.red + nationality.red + story.red,
      ),
      green: ClampUtils.clampRgbChannel(
        AppConstants.baseG + name.green + zodiac.green + nationality.green + story.green,
      ),
      blue: ClampUtils.clampRgbChannel(
        AppConstants.baseB + name.blue + zodiac.blue + nationality.blue + story.blue,
      ),
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
                'Spektrumun Oluştu',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              AuraPreviewCard(rgbValue: rgb),
              const SizedBox(height: 20),
              RgbDebugRow(rgbValue: rgb),
              const SizedBox(height: 12),
              Text(
                'İsim, burç, uyruk ve hikaye seçimlerin birleşerek '
                'sembolik aura spektrumunu oluşturdu.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                      color: AppColors.textSecondary,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              NameAnalysisDebugCard(result: nameResult),
              const SizedBox(height: 16),
              ZodiacAnalysisDebugCard(result: zodiacResult),
              const SizedBox(height: 16),
              NationalityAnalysisDebugCard(result: nationalityResult),
              const SizedBox(height: 16),
              StoryAnalysisDebugCard(result: storyResult),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
