import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/date_utils.dart';

class BirthDateInputCard extends StatelessWidget {
  final DateTime? selectedDate;
  final String? errorText;
  final VoidCallback onTap;

  const BirthDateInputCard({
    super.key,
    required this.selectedDate,
    required this.onTap,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final hasDate = selectedDate != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: hasDate
                    ? AppColors.primaryNeon
                    : AppColors.primaryNeon.withAlpha(60),
                width: hasDate ? 1.5 : 1.0,
              ),
              boxShadow: hasDate
                  ? [
                      BoxShadow(
                        color: AppColors.primaryNeon.withAlpha(35),
                        blurRadius: 18,
                        spreadRadius: 1,
                      ),
                    ]
                  : [],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: hasDate
                      ? AppColors.primaryNeon
                      : AppColors.textSecondary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    hasDate
                        ? 'Seçilen tarih: ${InnerHueDateUtils.formatTurkish(selectedDate!)}'
                        : 'Doğum tarihini seç',
                    style: TextStyle(
                      color: hasDate
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
                      fontSize: 15,
                      fontWeight:
                          hasDate ? FontWeight.w500 : FontWeight.normal,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: AppColors.textSecondary.withAlpha(150),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 4),
            child: Text(
              errorText!,
              style: const TextStyle(
                color: AppColors.error,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
