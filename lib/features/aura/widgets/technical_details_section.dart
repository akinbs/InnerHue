import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../models/final_aura_result.dart';
import '../models/name_aura_result.dart';
import '../models/nationality_aura_result.dart';
import '../models/rgb_delta.dart';
import '../models/story_aura_result.dart';
import '../models/zodiac_aura_result.dart';
import 'name_analysis_debug_card.dart';
import 'nationality_analysis_debug_card.dart';
import 'story_analysis_debug_card.dart';
import 'zodiac_analysis_debug_card.dart';

class TechnicalDetailsSection extends StatefulWidget {
  final FinalAuraResult finalResult;
  final NameAuraResult nameResult;
  final ZodiacAuraResult zodiacResult;
  final NationalityAuraResult nationalityResult;
  final StoryAuraResult storyResult;

  const TechnicalDetailsSection({
    super.key,
    required this.finalResult,
    required this.nameResult,
    required this.zodiacResult,
    required this.nationalityResult,
    required this.storyResult,
  });

  @override
  State<TechnicalDetailsSection> createState() =>
      _TechnicalDetailsSectionState();
}

class _TechnicalDetailsSectionState extends State<TechnicalDetailsSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton.icon(
          onPressed: () => setState(() => _expanded = !_expanded),
          icon: Icon(
            _expanded
                ? Icons.keyboard_arrow_up_rounded
                : Icons.keyboard_arrow_down_rounded,
            size: 18,
            color: AppColors.textSecondary,
          ),
          label: Text(
            _expanded ? 'Teknik Detayları Gizle' : 'Teknik Detayları Göster',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _expanded
              ? Column(
                  children: [
                    const SizedBox(height: 8),
                    NameAnalysisDebugCard(result: widget.nameResult),
                    const SizedBox(height: 14),
                    ZodiacAnalysisDebugCard(result: widget.zodiacResult),
                    const SizedBox(height: 14),
                    NationalityAnalysisDebugCard(
                        result: widget.nationalityResult),
                    const SizedBox(height: 14),
                    StoryAnalysisDebugCard(result: widget.storyResult),
                    const SizedBox(height: 14),
                    _FinalEngineDebugCard(result: widget.finalResult),
                  ],
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

// ── Private final engine debug card ──────────────────────────────────────────

class _FinalEngineDebugCard extends StatelessWidget {
  final FinalAuraResult result;

  const _FinalEngineDebugCard({required this.result});

  @override
  Widget build(BuildContext context) {
    final base = result.layerBreakdown.baseRgb;
    final seed = result.mergedSeedDelta;
    final story = result.storyDelta;
    final final_ = result.finalRgb;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryNeon.withAlpha(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title('Final Hesaplama'),
          const SizedBox(height: 12),
          _row('Taban RGB',
              'R ${base.red}  G ${base.green}  B ${base.blue}'),
          _deltaRow('Birleşik seed delta', seed),
          _deltaRow('Story delta', story),
          const Divider(color: AppColors.background, height: 20),
          _row('Final RGB',
              'R ${final_.red}  G ${final_.green}  B ${final_.blue}',
              highlight: true),
          _row('HEX', result.finalHex, highlight: true),
        ],
      ),
    );
  }

  Widget _title(String label) => Text(
        label,
        style: const TextStyle(
          color: AppColors.primaryNeon,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      );

  Widget _row(String label, String value, {bool highlight = false}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: TextStyle(
                  color: highlight
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                  fontSize: 13,
                  fontWeight:
                      highlight ? FontWeight.w600 : FontWeight.normal,
                )),
            Text(value,
                style: TextStyle(
                  color: highlight
                      ? AppColors.primaryNeon
                      : AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: highlight ? FontWeight.bold : FontWeight.w500,
                  fontFeatures: const [FontFeature.tabularFigures()],
                )),
          ],
        ),
      );

  Widget _deltaRow(String label, RgbDelta delta) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: const TextStyle(
                    color: AppColors.textSecondary, fontSize: 13)),
            Text(
              'R${_s(delta.red)}  G${_s(delta.green)}  B${_s(delta.blue)}',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFeatures: [FontFeature.tabularFigures()],
              ),
            ),
          ],
        ),
      );

  String _s(int v) => v >= 0 ? '+$v' : '$v';
}
