import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../models/aura_identity.dart';
import '../models/rgb_value.dart';

class AuraIdentityCard extends StatelessWidget {
  final AuraIdentity identity;
  final RgbValue finalRgb;
  final String finalHex;
  final String interpretation;

  const AuraIdentityCard({
    super.key,
    required this.identity,
    required this.finalRgb,
    required this.finalHex,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name + subtitle
          Text(
            identity.auraName,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            identity.auraSubtitle,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 13,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          // RGB + HEX row
          Row(
            children: [
              _ChannelBadge('R', finalRgb.red, AppColors.rgbRed),
              const SizedBox(width: 10),
              _ChannelBadge('G', finalRgb.green, AppColors.rgbGreen),
              const SizedBox(width: 10),
              _ChannelBadge('B', finalRgb.blue, AppColors.secondaryNeon),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  finalHex,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Dominant + intensity badges
          Row(
            children: [
              _InfoBadge(
                label: 'Baskın',
                value: _channelLabel(identity.dominantChannel),
                accentColor: AppColors.primaryNeon,
              ),
              const SizedBox(width: 10),
              _InfoBadge(
                label: 'Yoğunluk',
                value: identity.intensityLevel,
                accentColor: AppColors.warmAccent,
              ),
            ],
          ),
          // Visual keywords
          if (identity.visualKeywords.isNotEmpty) ...[
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: identity.visualKeywords
                  .map((k) => _KeywordChip(label: k))
                  .toList(),
            ),
          ],
          const SizedBox(height: 20),
          Container(height: 1, color: AppColors.borderSubtle),
          const SizedBox(height: 18),
          // Interpretation
          Text(
            interpretation,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              height: 1.75,
            ),
          ),
        ],
      ),
    );
  }

  static String _channelLabel(String channel) {
    return switch (channel) {
      'red' => 'Kırmızı',
      'green' => 'Yeşil',
      'blue' => 'Mavi',
      'balanced' => 'Dengeli',
      _ => channel,
    };
  }
}

class _ChannelBadge extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _ChannelBadge(this.label, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '$value',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFeatures: [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}

class _InfoBadge extends StatelessWidget {
  final String label;
  final String value;
  final Color accentColor;

  const _InfoBadge({
    required this.label,
    required this.value,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: accentColor.withAlpha(18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withAlpha(55)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: accentColor,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _KeywordChip extends StatelessWidget {
  final String label;

  const _KeywordChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.softViolet.withAlpha(18),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.softViolet.withAlpha(60)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.softViolet,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
