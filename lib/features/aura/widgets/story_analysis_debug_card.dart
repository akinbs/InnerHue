import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../models/rgb_delta.dart';
import '../models/story_aura_result.dart';

class StoryAnalysisDebugCard extends StatelessWidget {
  final StoryAuraResult result;

  const StoryAnalysisDebugCard({super.key, required this.result});

  static const Map<String, String> _axisLabels = {
    'activation': 'Hareket',
    'grounding': 'Zemin',
    'reflection': 'Yansıma',
    'openness': 'Açıklık',
    'threshold': 'Eşik',
    'balanced': 'Dengeli',
  };

  @override
  Widget build(BuildContext context) {
    final raw = result.accumulatedAxisDelta;
    final delta = result.storyDelta;
    final dominantLabel =
        _axisLabels[result.dominantAxis] ?? result.dominantAxis;

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
          _sectionTitle('Hikaye Analizi'),
          const SizedBox(height: 4),
          _row('Seçilen sahne', '${result.selectedOptionIds.length} / 15'),
          const SizedBox(height: 12),
          _sectionTitle('Ham Eksen Değerleri'),
          const SizedBox(height: 8),
          _axisRow('Hareket (activation)', raw.activation, result.normalizedActivation),
          _axisRow('Zemin (grounding)', raw.grounding, result.normalizedGrounding),
          _axisRow('Yansıma (reflection)', raw.reflection, result.normalizedReflection),
          _axisRow('Açıklık (openness)', raw.openness, result.normalizedOpenness),
          _axisRow('Eşik (threshold)', raw.threshold, result.normalizedThreshold),
          const SizedBox(height: 12),
          _sectionTitle('Baskın Eksen'),
          const SizedBox(height: 6),
          _row('Eksen', dominantLabel),
          const Divider(
            color: AppColors.background,
            height: 20,
          ),
          _deltaRow('Story delta', delta, highlight: true),
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

  Widget _axisRow(String label, double raw, double norm) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(label,
                  style: const TextStyle(
                      color: AppColors.textSecondary, fontSize: 12)),
            ),
            Text(
              '${raw.toStringAsFixed(0)}  →  ${norm.toStringAsFixed(2)}',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFeatures: [FontFeature.tabularFigures()],
              ),
            ),
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
                    highlight ? FontWeight.w600 : FontWeight.normal,
              )),
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
