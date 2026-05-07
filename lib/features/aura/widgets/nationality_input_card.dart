import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../data/country_aura_profiles_data.dart';
import '../models/country_aura_profile.dart';

class NationalityInputCard extends StatelessWidget {
  final CountryAuraProfile? selectedProfile;
  final String? errorText;
  final void Function(CountryAuraProfile?) onChanged;

  const NationalityInputCard({
    super.key,
    required this.selectedProfile,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final profiles = CountryAuraProfilesData.sortedByName;
    final isSelected = selectedProfile != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isSelected
                  ? AppColors.warmAccent.withAlpha(140)
                  : AppColors.borderSubtle,
              width: isSelected ? 1.5 : 1.0,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.warmAccent.withAlpha(22),
                      blurRadius: 24,
                      spreadRadius: 0,
                    ),
                  ]
                : const [
                    BoxShadow(
                      color: Color(0x1C000000),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ülke / Uyruk',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 12,
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 6),
              DropdownButtonHideUnderline(
                child: DropdownButton<CountryAuraProfile>(
                  value: selectedProfile,
                  hint: const Text(
                    'Bir ülke seç',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                  dropdownColor: AppColors.surfaceElevated,
                  isExpanded: true,
                  icon: const Icon(
                    Icons.expand_more_rounded,
                    color: AppColors.textMuted,
                  ),
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  items: profiles
                      .map(
                        (p) => DropdownMenuItem<CountryAuraProfile>(
                          value: p,
                          child: Text(p.countryName),
                        ),
                      )
                      .toList(),
                  onChanged: onChanged,
                ),
              ),
              if (isSelected) ...[
                const SizedBox(height: 8),
                _CountryBadge(
                  countryName: selectedProfile!.countryName,
                  code: selectedProfile!.countryCode,
                ),
              ],
            ],
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 6),
            child: Text(
              errorText!,
              style: const TextStyle(
                color: AppColors.error,
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ),
      ],
    );
  }
}

class _CountryBadge extends StatelessWidget {
  final String countryName;
  final String code;

  const _CountryBadge({required this.countryName, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.warmAccent.withAlpha(20),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.warmAccent.withAlpha(70)),
      ),
      child: Text(
        '$countryName · $code',
        style: const TextStyle(
          color: AppColors.warmAccent,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
