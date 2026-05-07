import 'package:flutter/material.dart';

class AuraOrb extends StatefulWidget {
  final Color color;
  final double size;

  const AuraOrb({
    super.key,
    required this.color,
    this.size = 100,
  });

  @override
  State<AuraOrb> createState() => _AuraOrbState();
}

class _AuraOrbState extends State<AuraOrb> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _breathe;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..repeat(reverse: true);
    _breathe = Tween<double>(begin: 0.88, end: 1.0).animate(
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
        final scale = _breathe.value;
        final glowAlpha = (255 * 0.25 * scale).round();
        final c = widget.color;

        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Center(
            child: Container(
              width: widget.size * scale,
              height: widget.size * scale,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    c.withAlpha(190),
                    c.withAlpha(70),
                    c.withAlpha(0),
                  ],
                  stops: const [0.0, 0.55, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: c.withAlpha(glowAlpha),
                    blurRadius: widget.size * 0.65,
                    spreadRadius: widget.size * 0.04,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
