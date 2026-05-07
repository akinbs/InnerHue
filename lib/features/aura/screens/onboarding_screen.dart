import 'package:flutter/material.dart';
import '../../../core/constants/app_texts.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/app_gradient_background.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/aura_orb.dart';
import 'name_input_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppGradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 52),
                const AuraOrb(
                  color: AppColors.softViolet,
                  size: 130,
                ),
                const SizedBox(height: 36),
                Text(
                  AppTexts.onboardingTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  AppTexts.onboardingDescription,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.7,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Klinik veya psikolojik değerlendirme sunmaz.',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 12,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                AppPrimaryButton(
                  label: AppTexts.onboardingButton,
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, _, _) => const NameInputScreen(),
                        transitionsBuilder: (_, animation, _, child) =>
                            FadeTransition(opacity: animation, child: child),
                        transitionDuration: const Duration(milliseconds: 400),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
