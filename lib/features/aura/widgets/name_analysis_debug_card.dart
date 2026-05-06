import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../models/name_aura_result.dart';
import '../models/rgb_delta.dart';

class NameAnalysisDebugCard extends StatelessWidget {
  final NameAuraResult result;

  const NameAnalysisDebugCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final b = result.breakdown;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryNeon.withAlpha(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(context, 'İsim Analizi'),
          const SizedBox(height: 12),
          _row('Normalize', b.normalizedName),
          _row('Geçerli harf', '${b.validLetterCount}'),
          _row(
            'Sesli/toplam',
            '${b.vowelCount} / ${b.validLetterCount}  '
                '(${(b.vowelRatio * 100).toStringAsFixed(1)}%)',
          ),
          const SizedBox(height: 12),
          _sectionTitle(context, 'Alt Skorlar'),
          const SizedBox(height: 8),
          _deltaRow('Letter score', b.letterScore),
          _deltaRow('Vowel feature', b.vowelFeatureScore),
          _deltaRow('Vowel ratio', b.vowelRatioScore),
          _deltaRow('Length', b.lengthScore),
          _deltaRow('Turkish chars', b.turkishCharacterScore),
          _deltaRow('Meaning', b.meaningScore),
          const Divider(color: AppColors.surface, height: 20),
          _deltaRow('Name delta', b.weightedRawScore, highlight: true),
          if (result.meaningTags.isNotEmpty) ...[
            const SizedBox(height: 12),
            _sectionTitle(context, 'Anlam Etiketleri'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: result.meaningTags
                  .map((t) => _tagChip(t.label))
                  .toList(),
            ),
          ],
          if (result.breakdown.debugNotes.isNotEmpty) ...[
            const SizedBox(height: 12),
            for (final note in result.breakdown.debugNotes)
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

  Widget _sectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.primaryNeon,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
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
  }

  Widget _deltaRow(String label, RgbDelta delta, {bool highlight = false}) {
    final color = highlight ? AppColors.textPrimary : AppColors.textSecondary;
    final valueColor =
        highlight ? AppColors.primaryNeon : AppColors.textPrimary;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  color: color,
                  fontSize: 13,
                  fontWeight:
                      highlight ? FontWeight.w600 : FontWeight.normal)),
          Text(
            'R${_sign(delta.red)}  G${_sign(delta.green)}  B${_sign(delta.blue)}',
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

  Widget _tagChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryNeon.withAlpha(30),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryNeon.withAlpha(80)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.primaryNeon,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  String _sign(int v) => v >= 0 ? '+$v' : '$v';
}
