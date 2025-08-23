import 'package:flutter/material.dart';
import 'package:glucose_app/widgets/app_card.dart';

class InfoPill extends StatelessWidget {
  const InfoPill({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    const mutedStyle = TextStyle(color: Colors.white70);
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: mutedStyle),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
