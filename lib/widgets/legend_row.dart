import 'package:flutter/material.dart';

import '../model/legendItem.dart';

class LegendRow extends StatelessWidget {
  const LegendRow({required this.items});

  final List<LegendItem> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: items
          .map(
            (it) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: it.color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(it.label, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          )
          .toList(),
    );
  }
}
