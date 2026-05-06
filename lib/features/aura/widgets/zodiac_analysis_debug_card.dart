import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/date_utils.dart';
import '../models/rgb_delta.dart';
import '../models/zodiac_aura_result.dart';

class ZodiacAnalysisDebugCard extends StatelessWidget {
  final ZodiacAuraResult result;

  const ZodiacAnalysisDebugCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final z = result;
    final sign = z.primarySign;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.secondaryNeon.withAlpha(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Burç Analizi'),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                sign.symbol,
                style: const TextStyle(
                  fontSize: 28,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sign.name,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    sign.auraLabel,
                    style: const TextStyle(
                      color: AppColors.secondaryNeon,
                      fontSize: 12,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          _row('Doğum tarihi', InnerHueDateUtils.formatTurkish(z.birthDate)),
          _row('Element', sign.element.turkishLabel),
          _row('Modalite', sign.modality.turkishLabel),
          _row('Polarite', sign.polarity.turkishLabel),
          _row('Geçiş günü', z.isCusp ? 'Evet' : 'Hayır'),
          if (z.blendedSign != null)
            _row(
              'Harmanlama',
              '${sign.name} %${(z.primaryWeight * 100).round()} '
                  '+ ${z.blendedSign!.name} %${(z.blendedWeight * 100).round()}',
            ),
          const SizedBox(height: 12),
          _sectionTitle('Alt Skorlar'),
          const SizedBox(height: 8),
          _deltaRow('Element delta', z.elementDelta),
          _deltaRow('Modality delta', z.modalityDelta),
          _deltaRow('Archetype delta', z.archetypeDelta),
          _deltaRow('Polarity delta', z.polarityDelta),
          const Divider(color: AppColors.surface, height: 20),
          _deltaRow('Zodiac delta', z.zodiacDelta, highlight: true),
          if (z.debugNotes.isNotEmpty) ...[
            const SizedBox(height: 10),
            for (final note in z.debugNotes)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '· $note',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Text(
        title,
        style: const TextStyle(
          color: AppColors.secondaryNeon,
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
            Text(label,
                style: const TextStyle(
                    color: AppColors.textSecondary, fontSize: 13)),
            Text(value,
                style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      );

  Widget _deltaRow(String label, RgbDelta delta, {bool highlight = false}) {
    final labelColor =
        highlight ? AppColors.textPrimary : AppColors.textSecondary;
    final valueColor =
        highlight ? AppColors.secondaryNeon : AppColors.textPrimary;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  color: labelColor,
                  fontSize: 13,
                  fontWeight:
                      highlight ? FontWeight.w600 : FontWeight.normal)),
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
