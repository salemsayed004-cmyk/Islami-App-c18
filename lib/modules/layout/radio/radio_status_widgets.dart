// ===========================================================================
// radio_status_widgets.dart  (Figma-matched redesign)
// Loading skeleton cards are gold-tinted; error widget uses same gold palette.
// ===========================================================================

import 'package:flutter/material.dart';

// ── Error widget ──────────────────────────────────────────────────────────

class RadioErrorWidget extends StatelessWidget {
  const RadioErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFD4A843).withOpacity(0.12),
              ),
              child: const Icon(
                Icons.wifi_off_rounded,
                size: 32,
                color: Color(0xFFD4A843),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Connection Error',
              style: TextStyle(
                fontFamily: 'Amiri',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFFD4A843),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(
                fontFamily: 'Amiri',
                fontSize: 14,
                color: Colors.white.withOpacity(0.5),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            GestureDetector(
              onTap: onRetry,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4A843),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1209),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Loading skeleton ──────────────────────────────────────────────────────

class RadioLoadingWidget extends StatefulWidget {
  const RadioLoadingWidget({super.key});

  @override
  State<RadioLoadingWidget> createState() => _RadioLoadingWidgetState();
}

class _RadioLoadingWidgetState extends State<RadioLoadingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _anim = Tween<double>(begin: 0.4, end: 0.75)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) => ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.only(top: 4),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) => _SkeletonCard(opacity: _anim.value, index: i),
      ),
    );
  }
}

class _SkeletonCard extends StatelessWidget {
  const _SkeletonCard({required this.opacity, required this.index});

  final double opacity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // Skeleton mirrors real card — gold tone at reduced opacity
        color: const Color(0xFFD4A843).withOpacity(opacity * 0.45),
      ),
    );
  }
}