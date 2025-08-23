import 'package:flutter/material.dart';

import '../constants.dart';
import 'app_card.dart';

class DeviceTile extends StatelessWidget {
  const DeviceTile({
    required this.title,
    required this.subtitle,
    required this.percent,
  });

  final String title, subtitle;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: titleStyle),
                const SizedBox(height: 4),
                Text(subtitle, style: mutedStyle),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF203045),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${(percent * 100).round()}%',
              style: const TextStyle(
                color: Color(0xFF4CD964),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
