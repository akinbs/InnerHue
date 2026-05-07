import 'package:flutter/material.dart';
import '../models/aura_identity.dart';
import '../models/rgb_value.dart';

class AnimatedFinalAuraCard extends StatefulWidget {
  final RgbValue rgbValue;
  final AuraIdentity identity;
  final String finalHex;

  const AnimatedFinalAuraCard({
    super.key,
    required this.rgbValue,
    required this.identity,
    required this.finalHex,
  });

  @override
  State<AnimatedFinalAuraCard> createState() => _AnimatedFinalAuraCardState();
}

class _AnimatedFinalAuraCardState extends State<AnimatedFinalAuraCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _breathe;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat(reverse: true);
    _breathe = Tween<double>(begin: 0.84, end: 1.0).animate(
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
        final r = widget.rgbValue.red;
        final g = widget.rgbValue.green;
        final b = widget.rgbValue.blue;
        final glowAlpha = (255 * 0.40 * _breathe.value).round();
        final gradients = widget.identity.gradientColors;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(glowAlpha, r, g, b),
                blurRadius: 55 * _breathe.value,
                spreadRadius: 6,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Radial gradient background from identity gradientColors
                Container(
                  width: double.infinity,
                  height: 290,
                  decoration: BoxDecoration(
                    gradient: gradients.length >= 3
                        ? RadialGradient(
                            center: Alignment.center,
                            radius: 0.95,
                            colors: [
                              gradients[0],
                              gradients[1],
                              gradients[2],
                            ],
                            stops: const [0.0, 0.50, 1.0],
                          )
                        : RadialGradient(
                            colors: [
                              Color.fromARGB(255, r, g, b),
                              Color.fromARGB(
                                220,
                                (r * 0.5).round().clamp(0, 255),
                                (g * 0.5).round().clamp(0, 255),
                                (b * 0.5).round().clamp(0, 255),
                              ),
                            ],
                            stops: const [0.0, 1.0],
                          ),
                  ),
                ),
                // Bottom gradient overlay for text legibility
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withAlpha(160),
                        ],
                      ),
                    ),
                  ),
                ),
                // Text overlay at bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 0, 22, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Intensity badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(55),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: Colors.white.withAlpha(35),
                            ),
                          ),
                          child: Text(
                            widget.identity.intensityLevel.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Aura name
                        Text(
                          widget.identity.auraName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                            shadows: [
                              Shadow(color: Colors.black45, blurRadius: 14),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Hex + RGB row
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(65),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                widget.finalHex,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.5,
                                  fontFeatures: [
                                    FontFeature.tabularFigures(),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${widget.rgbValue.red} · ${widget.rgbValue.green} · ${widget.rgbValue.blue}',
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 12,
                                height: 1.4,
                                fontFeatures: [FontFeature.tabularFigures()],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
