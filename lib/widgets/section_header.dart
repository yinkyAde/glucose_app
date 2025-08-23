import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.trailing});

  final String title;
  final Widget? trailing;


  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
    return Row(
      children: [
        Expanded(
          child: Text(title, style: titleStyle),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}