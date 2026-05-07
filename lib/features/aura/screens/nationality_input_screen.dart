import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../logic/nationality_aura_engine.dart';
import '../models/country_aura_profile.dart';
import '../models/name_aura_result.dart';
import '../models/zodiac_aura_result.dart';
import '../widgets/app_gradient_background.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/nationality_input_card.dart';
import 'story_intro_screen.dart';

class NationalityInputScreen extends StatefulWidget {
  final NameAuraResult nameResult;
  final ZodiacAuraResult zodiacResult;

  const NationalityInputScreen({
    super.key,
    required this.nameResult,
    required this.zodiacResult,
  });

  @override
  State<NationalityInputScreen> createState() =>
      _NationalityInputScreenState();
}

class _NationalityInputScreenState extends State<NationalityInputScreen> {
  CountryAuraProfile? _selectedProfile;
  String? _errorText;

  void _onChanged(CountryAuraProfile? profile) {
    setState(() {
      _selectedProfile = profile;
      _errorText = null;
    });
  }

  void _onSubmit() {
    if (_selectedProfile == null) {
      setState(() => _errorText = 'Devam etmek için bir ülke seçmelisin.');
      return;
    }
    final nationalityResult = NationalityAuraEngine.analyze(_selectedProfile!);
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, _, _) => StoryIntroScreen(
          nameResult: widget.nameResult,
          zodiacResult: widget.zodiacResult,
          nationalityResult: nationalityResult,
        ),
        transitionsBuilder: (_, animation, _, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AppGradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 56),
                Text(
                  'Uyruk katmanını seç',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 12),
                Text(
                  'Bu katman, seçtiğin ülkenin bayrak renklerinden sembolik bir renk imzası üretir.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 32),
                NationalityInputCard(
                  selectedProfile: _selectedProfile,
                  errorText: _errorText,
                  onChanged: _onChanged,
                ),
                const Spacer(),
                AppPrimaryButton(
                  label: 'Uyruk Katmanını Oluştur',
                  onPressed: _onSubmit,
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
