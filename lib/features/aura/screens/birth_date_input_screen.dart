import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../logic/zodiac_aura_engine.dart';
import '../models/name_aura_result.dart';
import '../widgets/app_gradient_background.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/birth_date_input_card.dart';
import 'nationality_input_screen.dart';

class BirthDateInputScreen extends StatefulWidget {
  final NameAuraResult nameResult;

  const BirthDateInputScreen({super.key, required this.nameResult});

  @override
  State<BirthDateInputScreen> createState() => _BirthDateInputScreenState();
}

class _BirthDateInputScreenState extends State<BirthDateInputScreen> {
  DateTime? _selectedDate;
  String? _errorText;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primaryNeon,
              onPrimary: AppColors.textPrimary,
              surface: AppColors.surfaceElevated,
              onSurface: AppColors.textPrimary,
            ),
            dialogTheme: const DialogThemeData(
              backgroundColor: AppColors.surfaceSecondary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _errorText = null;
      });
    }
  }

  void _onSubmit() {
    if (_selectedDate == null) {
      setState(
          () => _errorText = 'Devam etmek için doğum tarihini seçmelisin.');
      return;
    }
    final zodiacResult = ZodiacAuraEngine.analyze(_selectedDate!);
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, _, _) => NationalityInputScreen(
          nameResult: widget.nameResult,
          zodiacResult: zodiacResult,
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
                  'Doğum tarihinle\ndevam edelim',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 12),
                Text(
                  'Burç katmanı, spektrumuna sembolik bir renk yönü ekler.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 32),
                BirthDateInputCard(
                  selectedDate: _selectedDate,
                  errorText: _errorText,
                  onTap: _pickDate,
                ),
                const Spacer(),
                AppPrimaryButton(
                  label: 'Burç Katmanını Oluştur',
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
