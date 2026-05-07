import 'package:flutter/material.dart';
import '../../../core/constants/app_texts.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/app_gradient_background.dart';
import '../widgets/aura_orb.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
    Future.delayed(const Duration(milliseconds: 2400), _navigate);
  }

  void _navigate() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, _, _) => const OnboardingScreen(),
        transitionsBuilder: (_, animation, _, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppGradientBackground(
        child: Center(
          child: FadeTransition(
            opacity: _fade,
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Ambient orb behind text
                  const AuraOrb(
                    color: AppColors.primaryNeon,
                    size: 220,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        AppTexts.appName,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 38,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 5,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        AppTexts.splashTagline,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 13,
                          letterSpacing: 0.3,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
