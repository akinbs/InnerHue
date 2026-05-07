import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../logic/final_aura_engine.dart';
import '../models/final_aura_result.dart';
import '../models/name_aura_result.dart';
import '../models/nationality_aura_result.dart';
import '../models/story_aura_result.dart';
import '../models/zodiac_aura_result.dart';
import '../widgets/animated_final_aura_card.dart';
import '../widgets/app_gradient_background.dart';
import '../widgets/app_secondary_button.dart';
import '../widgets/aura_disclaimer_card.dart';
import '../widgets/aura_identity_card.dart';
import '../widgets/aura_layer_breakdown_card.dart';
import '../widgets/share_preview_card.dart';
import '../widgets/technical_details_section.dart';
import 'onboarding_screen.dart';

class FinalResultScreen extends StatefulWidget {
  final NameAuraResult nameResult;
  final ZodiacAuraResult zodiacResult;
  final NationalityAuraResult nationalityResult;
  final StoryAuraResult storyResult;

  const FinalResultScreen({
    super.key,
    required this.nameResult,
    required this.zodiacResult,
    required this.nationalityResult,
    required this.storyResult,
  });

  @override
  State<FinalResultScreen> createState() => _FinalResultScreenState();
}

class _FinalResultScreenState extends State<FinalResultScreen> {
  late final FinalAuraResult _finalResult;

  @override
  void initState() {
    super.initState();
    _finalResult = FinalAuraEngine.build(
      nameResult: widget.nameResult,
      zodiacResult: widget.zodiacResult,
      nationalityResult: widget.nationalityResult,
      storyResult: widget.storyResult,
    );
  }

  void _restart() {
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (_, _, _) => const OnboardingScreen(),
        transitionsBuilder: (_, animation, _, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 400),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final identity = _finalResult.auraIdentity;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppGradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header
                const SizedBox(height: 28),
                Text(
                  'Spektrumun Oluştu',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'İsim, burç, uyruk ve hikaye seçimlerin birleşti.',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 13,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),

                // Main aura card
                AnimatedFinalAuraCard(
                  rgbValue: _finalResult.finalRgb,
                  identity: identity,
                  finalHex: _finalResult.finalHex,
                ),
                const SizedBox(height: 20),

                // Identity + interpretation
                AuraIdentityCard(
                  identity: identity,
                  finalRgb: _finalResult.finalRgb,
                  finalHex: _finalResult.finalHex,
                  interpretation: _finalResult.interpretation,
                ),
                const SizedBox(height: 14),

                // Layer breakdown
                AuraLayerBreakdownCard(breakdown: _finalResult.layerBreakdown),
                const SizedBox(height: 14),

                // Share preview
                SharePreviewCard(
                  identity: identity,
                  finalRgb: _finalResult.finalRgb,
                  finalHex: _finalResult.finalHex,
                ),
                const SizedBox(height: 14),

                // Disclaimer
                const AuraDisclaimerCard(),
                const SizedBox(height: 6),

                // Technical details (collapsed)
                TechnicalDetailsSection(
                  finalResult: _finalResult,
                  nameResult: widget.nameResult,
                  zodiacResult: widget.zodiacResult,
                  nationalityResult: widget.nationalityResult,
                  storyResult: widget.storyResult,
                ),
                const SizedBox(height: 20),

                // Restart
                AppSecondaryButton(
                  label: 'Yeniden Başlat',
                  icon: Icons.refresh_rounded,
                  onPressed: _restart,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
