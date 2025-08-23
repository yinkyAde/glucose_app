import 'package:flutter/material.dart';

import 'action_chip.dart';

class QuickAddSheet extends StatelessWidget {
  const QuickAddSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(height: 4, width: 48,
                decoration: BoxDecoration(
                    color: Colors.white24, borderRadius: BorderRadius.circular(2))),
            const SizedBox(height: 20),
            Row(
              children: const [
                AppActionChip(icon: Icons.restaurant, label: 'Add Meal'),
                SizedBox(width: 12),
                AppActionChip(icon: Icons.monitor_heart, label: 'Log Glucose'),
                SizedBox(width: 12),
                AppActionChip(icon: Icons.directions_run, label: 'Add Activity'),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}