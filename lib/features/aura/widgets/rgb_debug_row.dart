import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../models/rgb_value.dart';

class RgbDebugRow extends StatelessWidget {
  final RgbValue rgbValue;

  const RgbDebugRow({super.key, required this.rgbValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ChannelLabel(label: 'R', value: rgbValue.red, color: AppColors.rgbRed),
          _ChannelLabel(label: 'G', value: rgbValue.green, color: AppColors.rgbGreen),
          _ChannelLabel(label: 'B', value: rgbValue.blue, color: AppColors.secondaryNeon),
          _HexLabel(hex: rgbValue.toHex()),
        ],
      ),
    );
  }
}

class _ChannelLabel extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _ChannelLabel({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$value',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _HexLabel extends StatelessWidget {
  final String hex;

  const _HexLabel({required this.hex});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'HEX',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          hex,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}
