import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AppGlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? borderRadius;
  final Color? borderColor;
  final Color? color;

  const AppGlassCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color ?? AppColors.surface,
        borderRadius: BorderRadius.circular(borderRadius ?? 24),
        border: Border.all(
          color: borderColor ?? AppColors.borderSubtle,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x24000000),
            blurRadius: 24,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}
