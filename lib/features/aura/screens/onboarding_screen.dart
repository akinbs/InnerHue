import 'package:flutter/material.dart';
import '../../../core/constants/app_texts.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/app_primary_button.dart';
import 'name_input_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                AppTexts.onboardingTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 24),
              Text(
                AppTexts.onboardingDescription,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.7,
                ),
              ),
              const Spacer(flex: 2),
              AppPrimaryButton(
                label: AppTexts.onboardingButton,
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (_, _, _) => const NameInputScreen(),
                      transitionsBuilder: (_, animation, _, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      transitionDuration: const Duration(milliseconds: 400),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
