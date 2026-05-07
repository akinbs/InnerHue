import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../models/aura_option.dart';

class StoryOptionCard extends StatelessWidget {
  final AuraOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const StoryOptionCard({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 64),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryNeon.withAlpha(22)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryNeon.withAlpha(200)
                : AppColors.borderSubtle,
            width: isSelected ? 1.5 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primaryNeon.withAlpha(22),
                    blurRadius: 18,
                    spreadRadius: 0,
                  ),
                ]
              : const [
                  BoxShadow(
                    color: Color(0x18000000),
                    blurRadius: 12,
                    offset: Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          children: [
            // Selected indicator dot
            AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? AppColors.primaryNeon
                    : Colors.transparent,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                option.label,
                style: TextStyle(
                  color: isSelected
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                  fontSize: 15,
                  fontWeight:
                      isSelected ? FontWeight.w500 : FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
