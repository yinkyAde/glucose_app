import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CarbsBarChart extends StatelessWidget {
  const CarbsBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final bars = <BarChartGroupData>[
      _bar(0, 65, normal: true, day: 'Su\n10 Jul'),
      _bar(1, 160, normal: false, day: 'Mo\n11 Jul'),
      _bar(2, 135, normal: true, day: 'Tu\n12 Jul'),
      _bar(3, 145, normal: true, day: 'We\n13 Jul'),
      _bar(4, 65, normal: true, day: 'Th\n14 Jul'),
      _bar(5, 145, normal: true, day: 'Fr\n15 Jul'),
    ];

    return BarChart(BarChartData(
      minY: 0, maxY: 180, groupsSpace: 18,
      barTouchData: BarTouchData(enabled: false),
      gridData: FlGridData(
        show: true, drawVerticalLine: false,
        getDrawingHorizontalLine: (v) => FlLine(color: Colors.white12, strokeWidth: 1),
      ),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true, reservedSize: 36, interval: 20,
            getTitlesWidget: (v, _) => Text(v.toInt().toString(),
                style: const TextStyle(color: Colors.white38, fontSize: 11)),
          ),
        ),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true, reservedSize: 40,
            getTitlesWidget: (v, _) => Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(_days[v.toInt()],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white54, fontSize: 11)),
            ),
          ),
        ),
      ),
      barGroups: bars,
      borderData: FlBorderData(show: false),
    ));
  }

  static const _days = ['Su\n10 Jul','Mo\n11 Jul','Tu\n12 Jul','We\n13 Jul','Th\n14 Jul','Fr\n15 Jul'];

  BarChartGroupData _bar(int x, double y, {required bool normal, required String day}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 18,
          borderRadius: BorderRadius.circular(6),
          color: normal ? const Color(0xFF4CD964) : const Color(0xFFFF6B4A),
        ),
      ],
    );
  }
}