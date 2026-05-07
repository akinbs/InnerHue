import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../models/aura_identity.dart';
import '../models/rgb_value.dart';

class SharePreviewCard extends StatelessWidget {
  final AuraIdentity identity;
  final RgbValue finalRgb;
  final String finalHex;

  const SharePreviewCard({
    super.key,
    required this.identity,
    required this.finalRgb,
    required this.finalHex,
  });

  void _onPreview(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Paylaşım özelliği sonraki sürümde eklenecek.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primary = finalRgb.toColor();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderSubtle),
        color: AppColors.surface,
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ColorSection(primary: primary, identity: identity),
          _SpectrumSection(
            finalRgb: finalRgb,
            finalHex: finalHex,
            primary: primary,
            onShare: () => _onPreview(context),
          ),
        ],
      ),
    );
  }
}

class _ColorSection extends StatefulWidget {
  final Color primary;
  final AuraIdentity identity;

  const _ColorSection({required this.primary, required this.identity});

  @override
  State<_ColorSection> createState() => _ColorSectionState();
}

class _ColorSectionState extends State<_ColorSection>
    with TickerProviderStateMixin {
  late final AnimationController _bgCtrl;
  late final AnimationController _stripeCtrl;
  late final Animation<Color?> _bgAnim;
  late final Animation<double> _stripeAnim;

  @override
  void initState() {
    super.initState();
    _bgCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat(reverse: true);
    _bgAnim = ColorTween(begin: widget.primary, end: Colors.white)
        .animate(CurvedAnimation(parent: _bgCtrl, curve: Curves.easeInOut));

    _stripeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat();
    _stripeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(_stripeCtrl);
  }

  @override
  void dispose() {
    _bgCtrl.dispose();
    _stripeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_bgAnim, _stripeAnim]),
      builder: (context, _) {
        final bg = _bgAnim.value ?? widget.primary;
        return SizedBox(
          height: 180,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ColoredBox(color: bg),
              CustomPaint(
                painter: _DiagonalStripesPainter(
                  phase: _stripeAnim.value,
                  stripeColor: widget.primary,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withAlpha(110),
                      ],
                    ),
                  ),
                ),
              ),
              // Brand tag top-left
              Positioned(
                top: 12,
                left: 14,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(50),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'InnerHue',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.6,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 14,
                right: 14,
                child: Text(
                  'Spektrumum',
                  style: TextStyle(
                    color: Colors.white.withAlpha(110),
                    fontSize: 9,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              // Aura name at bottom
              Positioned(
                bottom: 14,
                left: 14,
                right: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.identity.auraName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                        shadows: [Shadow(color: Colors.black38, blurRadius: 8)],
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(60),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        widget.identity.intensityLevel.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DiagonalStripesPainter extends CustomPainter {
  final double phase;
  final Color stripeColor;

  const _DiagonalStripesPainter({
    required this.phase,
    required this.stripeColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const step = 40.0;
    const stripeW = 14.0;
    const alpha = 45;

    final paint = Paint()
      ..color = stripeColor.withAlpha(alpha)
      ..style = PaintingStyle.fill;

    final offset = phase * step;
    final H = size.height;

    for (double p = -H + offset - step; p < size.width + H + step; p += step) {
      final path = Path()
        ..moveTo(p, 0)
        ..lineTo(p + stripeW, 0)
        ..lineTo(p + stripeW - H, H)
        ..lineTo(p - H, H)
        ..close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_DiagonalStripesPainter old) =>
      old.phase != phase || old.stripeColor != stripeColor;
}

class _SpectrumSection extends StatelessWidget {
  final RgbValue finalRgb;
  final String finalHex;
  final Color primary;
  final VoidCallback onShare;

  const _SpectrumSection({
    required this.finalRgb,
    required this.finalHex,
    required this.primary,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 16),
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'KANAL SPEKTRUMU',
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 9,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.8,
            ),
          ),
          const SizedBox(height: 10),
          _ChannelBar(
              label: 'R', value: finalRgb.red, barColor: AppColors.rgbRed),
          const SizedBox(height: 6),
          _ChannelBar(
              label: 'G', value: finalRgb.green, barColor: AppColors.rgbGreen),
          const SizedBox(height: 6),
          _ChannelBar(
              label: 'B',
              value: finalRgb.blue,
              barColor: AppColors.secondaryNeon),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  color: primary.withAlpha(25),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: primary.withAlpha(55)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      finalHex,
                      style: TextStyle(
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.8,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onShare,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.borderSubtle),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.share_outlined,
                          size: 13, color: AppColors.textSecondary),
                      SizedBox(width: 5),
                      Text(
                        'Paylaşım Kartını Ön İzle',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChannelBar extends StatelessWidget {
  final String label;
  final int value;
  final Color barColor;

  const _ChannelBar({
    required this.label,
    required this.value,
    required this.barColor,
  });

  @override
  Widget build(BuildContext context) {
    final fraction = value / 255.0;

    return Row(
      children: [
        SizedBox(
          width: 13,
          child: Text(
            label,
            style: TextStyle(
              color: barColor,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Stack(
              children: [
                Container(height: 6, color: barColor.withAlpha(22)),
                FractionallySizedBox(
                  widthFactor: fraction,
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      gradient: LinearGradient(
                        colors: [barColor.withAlpha(150), barColor],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 26,
          child: Text(
            '$value',
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 11,
              fontFeatures: [FontFeature.tabularFigures()],
            ),
          ),
        ),
      ],
    );
  }
}
