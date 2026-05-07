import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../models/nationality_aura_result.dart';
import '../models/rgb_delta.dart';

class NationalityAnalysisDebugCard extends StatelessWidget {
  final NationalityAuraResult result;

  const NationalityAnalysisDebugCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final r = result;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.tertiaryNeon.withAlpha(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Uyruk Analizi'),
          const SizedBox(height: 12),
          _row('Ülke', r.countryName),
          _row('Kod', r.countryCode),
          const SizedBox(height: 12),
          _sectionTitle('Hesaplama Detayları'),
          const SizedBox(height: 8),
          _row(
            'Ağırlıklı bayrak RGB',
            'R${r.weightedFlagRgb.red}  G${r.weightedFlagRgb.green}  B${r.weightedFlagRgb.blue}',
          ),
          _row('Kontrast skoru', r.contrastScore.toStringAsFixed(1)),
          _deltaRow('Palet delta (×0.70)', r.flagPaletteDelta),
          _deltaRow('Kontrast delta (×0.15)', r.contrastDelta),
          _deltaRow('Kod varyasyonu (×0.15)', r.countryCodeVariationDelta),
          const Divider(color: AppColors.surface, height: 20),
          _deltaRow('Uyruk delta', r.nationalityDelta, highlight: true),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Text(
        title,
        style: const TextStyle(
          color: AppColors.tertiaryNeon,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      );

  Widget _row(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );

  Widget _deltaRow(String label, RgbDelta delta, {bool highlight = false}) {
    final labelColor =
        highlight ? AppColors.textPrimary : AppColors.textSecondary;
    final valueColor =
        highlight ? AppColors.tertiaryNeon : AppColors.textPrimary;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: labelColor,
              fontSize: 13,
              fontWeight: highlight ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          Text(
            'R${_s(delta.red)}  G${_s(delta.green)}  B${_s(delta.blue)}',
            style: TextStyle(
              color: valueColor,
              fontSize: 13,
              fontWeight: highlight ? FontWeight.bold : FontWeight.w500,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }

  String _s(int v) => v >= 0 ? '+$v' : '$v';
}
