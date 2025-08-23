import 'package:flutter/material.dart';
import 'package:glucose_app/widgets/rootshell.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const GlucoseApp());

class GlucoseApp extends StatelessWidget {
  const GlucoseApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0D0F14),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF7C5CFF),
        secondary: Color(0xFF2AD5C9),
        surface: Color(0xFF151A22),
        onSurface: Colors.white,
        tertiary: Color(0xFF44C069),
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'Health Dashboard',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const RootShell(),
    );
  }
}
























