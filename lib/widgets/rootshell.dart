import 'package:flutter/material.dart';
import 'package:glucose_app/profile_screen.dart';
import 'package:glucose_app/widgets/pill_bottom_bar.dart';
import 'package:glucose_app/widgets/quick_add_sheet.dart';

import '../home_screen.dart';
import '../insight_screen.dart';
import '../message_Screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});
  @override
  State<RootShell> createState() => RootShellState();
}

class RootShellState extends State<RootShell> {
  int index = 0;

  final pages = const [
    HomeScreen(),
    InsightsScreen(),
    SizedBox.shrink(), // placeholder for "+"
    MessagesStub(),
    ProfileScreen(),
  ];

  void onItemTap(int i) {
    if (i == 2) {
      // “+” action — to open a modal sheet
      showModalBottomSheet(
        context: context,
        backgroundColor: const Color(0xFF151A22),
        showDragHandle: true,
        builder: (c) => const QuickAddSheet(),
      );
      return;
    }
    setState(() => index = i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: PillBottomBar(
          currentIndex: index,
          onTap: onItemTap,
        ),
      ),
    );
  }
}