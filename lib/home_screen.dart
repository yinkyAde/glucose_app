import 'package:flutter/material.dart';
import 'package:glucose_app/widgets/section_header.dart';
import 'package:glucose_app/widgets/app_card.dart';
import 'package:glucose_app/widgets/glucose_line_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'model/legendItem.dart';
import 'widgets/legend_row.dart';
import 'widgets/metric_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
      children: [
        Text('Hi, Emily!', style: GoogleFonts.inter(
            fontSize: 34, fontWeight: FontWeight.w800)),
        const SizedBox(height: 4),
        Text('Sat, 9 July', style: TextStyle(color: Colors.white70)),
        const SizedBox(height: 16),

        AppCard(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Eaten', style: titleStyle),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text('24 GL ', style: greenStyle),
                        Text('of 64 GL', style: mutedStyle),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: cs.surface.withOpacity(.6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('40 GL left',
                          style: TextStyle(color: Colors.white70)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 90, width: 90,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 90, width: 90,
                      child: CircularProgressIndicator(
                        value: .36, strokeWidth: 8,
                        backgroundColor: const Color(0xFF222733),
                        valueColor: AlwaysStoppedAnimation(cs.tertiary),
                      ),
                    ),
                    const Text('36%')
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 14),

        GridView.count(
          shrinkWrap: true, crossAxisCount: 2, childAspectRatio: 1.8,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12, crossAxisSpacing: 12,
          children: const [
            MetricTile(label: 'Glucose', value: '136', unit: 'mg/dl', emoji: '🩸'),
            MetricTile(label: 'Pills', value: '1', unit: 'taken', emoji: '💊'),
            MetricTile(label: 'Activity', value: '244', unit: 'steps', emoji: '🏀'),
            MetricTile(label: 'Carbs', value: '522', unit: 'cal', emoji: '🍎'),
          ],
        ),
        const SizedBox(height: 14),

        AppCard(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: 'Blood Sugar',
                trailing: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white70),
                    children: [
                      const TextSpan(text: 'Avg this week '),
                      TextSpan(text: '120mg/dL',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const LegendRow(items: [
                LegendItem('Before meal', Color(0xFF729BFF)),
                LegendItem('After meal', Color(0xFF2AD5C9)),
              ]),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: GlucoseLineChart(showGrid: true),
              ),
            ],
          ),
        ),
      ],
    );
  }
}