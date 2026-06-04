// ===========================================================================
// radio_tab_bar.dart
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:islami/modules/layout/radio/radio_state.dart';

class RadioTabBar extends StatelessWidget {
  const RadioTabBar({
    super.key,
    required this.activeTab,
    required this.onTabChanged,
  });

  final RadioTab activeTab;
  final ValueChanged<RadioTab> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF121212).withValues(alpha: 0.6), // خلفية شفافة غامقة للحاوية
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            _TabPill(
              label: 'Radio',
              isActive: activeTab == RadioTab.radio,
              onTap: () => onTabChanged(RadioTab.radio),
              isLeft: true,
            ),
            _TabPill(
              label: 'Reciters',
              isActive: activeTab == RadioTab.reciters,
              onTap: () => onTabChanged(RadioTab.reciters),
              isLeft: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _TabPill extends StatelessWidget {
  const _TabPill({
    required this.label,
    required this.isActive,
    required this.onTap,
    required this.isLeft,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          height: 45,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFE2BE7F) : Colors.transparent,
            borderRadius: BorderRadius.circular(12), // حواف دائرية للـ Tab زي التصميم
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isActive ? const Color(0xFF242424) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}