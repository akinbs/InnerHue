import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/date_utils.dart';
import '../data/zodiac_signs_data.dart';
import '../models/zodiac_sign.dart';

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

  ZodiacSign? _getZodiacSign(DateTime date) {
    final mmdd = date.month * 100 + date.day;
    for (final sign in ZodiacSignsData.signs) {
      final startMmdd = sign.startMonth * 100 + sign.startDay;
      final endMmdd = sign.endMonth * 100 + sign.endDay;
      if (startMmdd <= endMmdd) {
        if (mmdd >= startMmdd && mmdd <= endMmdd) return sign;
      } else {
        if (mmdd >= startMmdd || mmdd <= endMmdd) return sign;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final hasDate = selectedDate != null;
    final zodiac = hasDate ? _getZodiacSign(selectedDate!) : null;

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
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: hasDate
                    ? AppColors.primaryNeon.withAlpha(160)
                    : AppColors.borderSubtle,
                width: hasDate ? 1.5 : 1.0,
              ),
              boxShadow: hasDate
                  ? [
                      BoxShadow(
                        color: AppColors.primaryNeon.withAlpha(28),
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
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color:
                      hasDate ? AppColors.primaryNeon : AppColors.textMuted,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    hasDate
                        ? InnerHueDateUtils.formatTurkish(selectedDate!)
                        : 'Doğum tarihini seç',
                    style: TextStyle(
                      color: hasDate
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
                      fontSize: 16,
                      fontWeight:
                          hasDate ? FontWeight.w500 : FontWeight.w400,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.textMuted,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        if (zodiac != null) ...[
          const SizedBox(height: 12),
          _ZodiacBadge(sign: zodiac),
        ],
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

class _ZodiacBadge extends StatelessWidget {
  final ZodiacSign sign;

  const _ZodiacBadge({required this.sign});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.softViolet.withAlpha(22),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: AppColors.softViolet.withAlpha(70),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                sign.symbol,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.2,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                sign.name,
                style: const TextStyle(
                  color: AppColors.softViolet,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
