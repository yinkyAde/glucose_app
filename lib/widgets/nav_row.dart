import 'package:flutter/material.dart';
import 'package:glucose_app/widgets/app_card.dart';

class NavRow extends StatelessWidget {
  const NavRow({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontSize: 16))),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
