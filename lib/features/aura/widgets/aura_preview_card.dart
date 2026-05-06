import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../models/rgb_value.dart';

class AuraPreviewCard extends StatefulWidget {
  final RgbValue rgbValue;

  const AuraPreviewCard({super.key, required this.rgbValue});

  @override
  State<AuraPreviewCard> createState() => _AuraPreviewCardState();
}

class _AuraPreviewCardState extends State<AuraPreviewCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _breathe;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _breathe = Tween<double>(begin: 0.82, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _breathe,
      builder: (context, _) {
        final glowAlpha = (255 * 0.38 * _breathe.value).round();
        final r = widget.rgbValue.red;
        final g = widget.rgbValue.green;
        final b = widget.rgbValue.blue;
        final glowColor = Color.fromARGB(glowAlpha, r, g, b);

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: glowColor,
                blurRadius: 56 * _breathe.value,
                spreadRadius: 6 * _breathe.value,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: _breathe.value * 1.1,
                  colors: [
                    Color.fromARGB(230, r, g, b),
                    Color.fromARGB(128, r, g, b),
                    AppColors.surface,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
