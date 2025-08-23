import 'package:flutter/material.dart';

class BottomItem extends StatelessWidget {
  const BottomItem({super.key, required this.icon, required this.selected, this.onTap});

  final IconData icon;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: selected ? 1 : .6,
          child: Icon(icon, size: 26),
        ),
      ),
    );
  }
}
