import 'package:flutter/material.dart';
import 'package:glucose_app/widgets/bottom_item.dart';

class PillBottomBar extends StatelessWidget {
  const PillBottomBar({super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: const Color(0xFF1A202A),
        borderRadius: BorderRadius.circular(36),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          BottomItem(
            icon: Icons.home_filled, selected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          BottomItem(
            icon: Icons.stacked_bar_chart, selected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () => onTap(2),
                child: Container(
                  height: 52, width: 52,
                  decoration: BoxDecoration(
                    color: cs.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: cs.primary.withOpacity(.45),
                          blurRadius: 12, spreadRadius: 1)
                    ],
                  ),
                  child: const Icon(Icons.add, size: 28),
                ),
              ),
            ),
          ),
          BottomItem(
            icon: Icons.chat_bubble_outline, selected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
          BottomItem(
            icon: Icons.person, selected: currentIndex == 4,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }
}