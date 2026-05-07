import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../models/aura_layer_breakdown.dart';
import '../models/rgb_delta.dart';

class AuraLayerBreakdownCard extends StatelessWidget {
  final AuraLayerBreakdown breakdown;

  const AuraLayerBreakdownCard({super.key, required this.breakdown});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: const [
          BoxShadow(
            color: Color(0x20000000),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 3,
                height: 14,
                decoration: BoxDecoration(
                  color: AppColors.warmAccent,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'KATMAN KIRILIMI',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _LayerRow(
            name: 'İsim Katmanı',
            delta: breakdown.nameDelta,
            accentColor: AppColors.primaryNeon,
          ),
          const SizedBox(height: 2),
          const _RowDivider(),
          const SizedBox(height: 2),
          _LayerRow(
            name: 'Burç Katmanı',
            delta: breakdown.zodiacDelta,
            accentColor: AppColors.softViolet,
          ),
          const SizedBox(height: 2),
          const _RowDivider(),
          const SizedBox(height: 2),
          _LayerRow(
            name: 'Uyruk Katmanı',
            delta: breakdown.nationalityDelta,
            accentColor: AppColors.warmAccent,
          ),
          const SizedBox(height: 2),
          const _RowDivider(),
          const SizedBox(height: 2),
          _LayerRow(
            name: 'Hikaye Katmanı',
            delta: breakdown.storyDelta,
            accentColor: AppColors.success,
            isHighlight: true,
          ),
          const SizedBox(height: 16),
          Container(height: 1, color: AppColors.borderSubtle),
          const SizedBox(height: 14),
          // Final row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Final Spektrum',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'R ${breakdown.finalRgb.red}  '
                'G ${breakdown.finalRgb.green}  '
                'B ${breakdown.finalRgb.blue}',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RowDivider extends StatelessWidget {
  const _RowDivider();

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: AppColors.borderSubtle.withAlpha(80));
  }
}

class _LayerRow extends StatelessWidget {
  final String name;
  final RgbDelta delta;
  final Color accentColor;
  final bool isHighlight;

  const _LayerRow({
    required this.name,
    required this.delta,
    required this.accentColor,
    this.isHighlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 14,
            decoration: BoxDecoration(
              color: accentColor.withAlpha(160),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: isHighlight
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
                fontSize: 13,
                fontWeight:
                    isHighlight ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
          Text(
            '${_s(delta.red)} / ${_s(delta.green)} / ${_s(delta.blue)}',
            style: TextStyle(
              color: isHighlight ? accentColor : AppColors.textSecondary,
              fontSize: 12,
              fontWeight: isHighlight ? FontWeight.w600 : FontWeight.w500,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }

  String _s(int v) => v >= 0 ? '+$v' : '$v';
}
