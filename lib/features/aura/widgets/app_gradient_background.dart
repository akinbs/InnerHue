import 'package:flutter/material.dart';

class AppGradientBackground extends StatelessWidget {
  final Widget child;

  const AppGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: Color(0xFF090A12)),
        // Top-right: very subtle primary accent glow
        Positioned(
          top: -90,
          right: -90,
          child: Container(
            width: 340,
            height: 340,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [Color(0x118F5CFF), Color(0x008F5CFF)],
              ),
            ),
          ),
        ),
        // Bottom-left: very subtle secondary accent glow
        Positioned(
          bottom: -70,
          left: -70,
          child: Container(
            width: 260,
            height: 260,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [Color(0x0A00D4FF), Color(0x0000D4FF)],
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
