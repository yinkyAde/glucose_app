import 'package:flutter/material.dart';
import 'package:glucose_app/widgets/section_header.dart';
import 'package:glucose_app/widgets/app_card.dart';
import 'package:glucose_app/widgets/carbs_bar_chart.dart';
import 'package:glucose_app/widgets/glucose_line_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/legendItem.dart';
import 'widgets/legend_row.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
      children: [
        Text('Insights', style: GoogleFonts.inter(
            fontSize: 34, fontWeight: FontWeight.w800)),
        const SizedBox(height: 16),

        AppCard(
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: 'Blood Sugar',
                trailing: _avgText('120mg/dL'),
              ),
              const SizedBox(height: 8),
              const LegendRow(items: [
                LegendItem('Before meal', Color(0xFF729BFF)),
                LegendItem('After meal', Color(0xFF2AD5C9)),
              ]),
              const SizedBox(height: 8),
              const SizedBox(height: 200, child: GlucoseLineChart()),
            ],
          ),
        ),
        const SizedBox(height: 12),

        AppCard(
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(title: 'Carbs Level', trailing: _avgText('127g')),
              const SizedBox(height: 8),
              const LegendRow(items: [
                LegendItem('Normal', Color(0xFF4CD964)),
                LegendItem('Above normal', Color(0xFFFF6B4A)),
              ]),
              const SizedBox(height: 8),
              const SizedBox(height: 220, child: CarbsBarChart()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _avgText(String v) => RichText(
    text: TextSpan(
      style: const TextStyle(color: Colors.white70),
      children: [
        const TextSpan(text: 'Avg this week '),
        TextSpan(text: v,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
      ],
    ),
  );
}