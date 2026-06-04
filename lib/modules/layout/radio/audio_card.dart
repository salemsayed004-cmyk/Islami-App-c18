// ===========================================================================
// audio_card.dart
// ===========================================================================

import 'package:flutter/material.dart';

class AudioCardData {
  const AudioCardData({required this.id, required this.title, this.subtitle});
  final String id;
  final String title;
  final String? subtitle;
}

class AudioCard extends StatelessWidget {
  const AudioCard({
    super.key,
    required this.data,
    required this.isPlaying,
    required this.isBuffering,
    required this.isMuted,
    required this.onPlayTap,
    required this.onMuteTap,
    this.index = 0,
  });

  final AudioCardData data;
  final bool isPlaying;
  final bool isBuffering;
  final bool isMuted;
  final VoidCallback onPlayTap;
  final VoidCallback onMuteTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    // لون الكارت الذهبي اللي في الـ Figma
    const Color cardColor = Color(0xFFE2BE7F);
    const Color contentColor = Color(0xFF242424);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      height: 130, // ارتفاع الكارت لتناسب شكل Figma
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // 1. رسمة المساجد في قاع الكارت
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/img_bottom_decoration.png',
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),

            // 2. الموجة الصوتية (تظهر فقط عند التشغيل كما في الـ Figma)
            if (isPlaying)
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Image.asset(
                    'assets/images/soundWave 1 (1).png',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    color: contentColor.withValues(alpha: 0.8),
                  ),
                ),
              ),

            // 3. المحتوى الأساسي (النص والأزرار)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // العنوان
                  Text(
                    data.title,
                    style: const TextStyle(
                      fontFamily: 'Amiri', // تأكد من وجود الخط عندك
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: contentColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),

                  // أزرار التحكم
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // زر التشغيل / الإيقاف
                      GestureDetector(
                        onTap: onPlayTap,
                        child: isBuffering
                            ? const SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(color: contentColor, strokeWidth: 3),
                        )
                            : Icon(
                          isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                          size: 48,
                          color: contentColor,
                        ),
                      ),
                      const SizedBox(width: 12),

                      // زر كتم الصوت
                      GestureDetector(
                        onTap: onMuteTap,
                        child: Icon(
                          isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
                          size: 32,
                          color: contentColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}