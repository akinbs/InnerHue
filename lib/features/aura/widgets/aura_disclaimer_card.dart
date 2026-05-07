import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AuraDisclaimerCard extends StatelessWidget {
  const AuraDisclaimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSubtle.withAlpha(120)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_outline_rounded,
            size: 15,
            color: AppColors.textMuted,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'InnerHue klinik veya psikolojik değerlendirme sunmaz. '
              'Bu sonuç; isim, sembolik başlangıç katmanları ve hikaye '
              'seçimlerinden üretilmiş yaratıcı bir renk haritasıdır.',
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 12,
                height: 1.65,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
