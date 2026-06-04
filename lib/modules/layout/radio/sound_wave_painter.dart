// ===========================================================================
// sound_wave_painter.dart
// Animated sound-wave overlay rendered via CustomPainter.
// Uses a repeating sine animation — no asset required.
// Drop Assets.images.soundWave here if the project has the asset.
// ===========================================================================

import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Renders 3 stacked, phase-shifted sine waves that animate continuously.
/// Used as an overlay inside each audio card.
class SoundWavePainter extends CustomPainter {
  SoundWavePainter({
    required this.animation,
    required this.color,
    this.waveCount = 3,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color color;
  final int waveCount;

  @override
  void paint(Canvas canvas, Size size) {
    for (int w = 0; w < waveCount; w++) {
      final phase = (2 * math.pi * w / waveCount) + animation.value * 2 * math.pi;
      final amplitude = size.height * (0.18 - w * 0.04);
      final opacity = 0.5 - w * 0.13;

      final paint = Paint()
        ..color = color.withOpacity(opacity.clamp(0.05, 0.5))
        ..strokeWidth = 1.5
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      final path = Path();
      const steps = 120;

      for (int i = 0; i <= steps; i++) {
        final x = size.width * i / steps;
        final y = size.height / 2 +
            amplitude * math.sin((i / steps) * 4 * math.pi + phase);

        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(SoundWavePainter oldDelegate) =>
      oldDelegate.animation != animation || oldDelegate.color != color;
}

/// A widget that wraps [SoundWavePainter] with an [AnimationController].
/// Set [isAnimating] to true while audio is playing/buffering.
class SoundWaveOverlay extends StatefulWidget {
  const SoundWaveOverlay({
    super.key,
    required this.isAnimating,
    this.color = const Color(0xFFD4AF37),
  });

  final bool isAnimating;
  final Color color;

  @override
  State<SoundWaveOverlay> createState() => _SoundWaveOverlayState();
}

class _SoundWaveOverlayState extends State<SoundWaveOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    if (widget.isAnimating) _controller.repeat();
  }

  @override
  void didUpdateWidget(SoundWaveOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.isAnimating && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: widget.isAnimating ? 1.0 : 0.35,
      child: CustomPaint(
        painter: SoundWavePainter(
          animation: _controller,
          color: widget.color,
        ),
        size: Size.infinite,
      ),
    );
  }
}