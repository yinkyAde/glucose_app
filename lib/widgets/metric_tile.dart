import 'package:flutter/material.dart';
import 'package:glucose_app/widgets/app_card.dart';

class MetricTile extends StatelessWidget {
  const MetricTile({super.key,
    required this.label,
    required this.value,
    required this.unit,
    required this.emoji,
  });

  final String label, value, unit, emoji;

  @override
  Widget build(BuildContext context) {
    const mutedStyle = TextStyle(color: Colors.white70);
    return AppCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: mutedStyle),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(unit, style: mutedStyle),
                  ],
                ),
              ],
            ),
          ),
          Text(emoji, style: const TextStyle(fontSize: 35)),
        ],
      ),
    );
  }
}
