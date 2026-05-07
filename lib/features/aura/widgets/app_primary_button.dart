import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AppPrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;

  const AppPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  State<AppPrimaryButton> createState() => _AppPrimaryButtonState();
}

class _AppPrimaryButtonState extends State<AppPrimaryButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null;

    return GestureDetector(
      onTapDown: isEnabled ? (_) => setState(() => _pressed = true) : null,
      onTapUp: isEnabled
          ? (_) {
              setState(() => _pressed = false);
            }
          : null,
      onTapCancel: isEnabled ? () => setState(() => _pressed = false) : null,
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: AnimatedOpacity(
          opacity: isEnabled ? 1.0 : 0.35,
          duration: const Duration(milliseconds: 200),
          child: Container(
            height: 54,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: isEnabled
                  ? const LinearGradient(
                      colors: [AppColors.primaryNeon, AppColors.secondaryNeon],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                  : null,
              color: isEnabled ? null : AppColors.borderSubtle,
              borderRadius: BorderRadius.circular(18),
              boxShadow: isEnabled && !_pressed
                  ? [
                      BoxShadow(
                        color: AppColors.primaryNeon.withAlpha(50),
                        blurRadius: 22,
                        offset: const Offset(0, 5),
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: Text(
                widget.label,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
