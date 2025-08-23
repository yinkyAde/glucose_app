import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GlucoseLineChart extends StatelessWidget {
  const GlucoseLineChart({super.key, this.showGrid = false});
  final bool showGrid;

  List<FlSpot> get beforeMeal => const [
    FlSpot(0, 35), FlSpot(1, 90), FlSpot(2, 78), FlSpot(3, 38),
    FlSpot(4, 82), FlSpot(5, 75), FlSpot(6, 32),
  ];

  List<FlSpot> get afterMeal => const [
    FlSpot(0, 170), FlSpot(1, 140), FlSpot(2, 145), FlSpot(3, 110),
    FlSpot(4, 125), FlSpot(5, 130), FlSpot(6, 60),
  ];

  @override
  Widget build(BuildContext context) {
    final grid = FlGridData(
      show: showGrid,
      drawVerticalLine: false,
      getDrawingHorizontalLine: (value) => FlLine(
          color: Colors.white12, strokeWidth: 1),
    );

    return LineChart(LineChartData(
      minX: 0, maxX: 6, minY: 0, maxY: 180,
      gridData: grid,
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true, reservedSize: 36, interval: 40,
            getTitlesWidget: (v, meta) => Text(v.toInt().toString(),
                style: const TextStyle(color: Colors.white38, fontSize: 11)),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true, interval: 1, reservedSize: 28,
            getTitlesWidget: (v, meta) {
              const days = ['Su','Mo','Tu','We','Th','Fr','Sa'];
              return Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(days[v.toInt()],
                    style: const TextStyle(color: Colors.white38, fontSize: 12)),
              );
            },
          ),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: beforeMeal, isCurved: true, barWidth: 3,
          color: const Color(0xFF729BFF),
          dotData: const FlDotData(show: true),
        ),
        LineChartBarData(
          spots: afterMeal, isCurved: true, barWidth: 3,
          color: const Color(0xFF2AD5C9),
          dotData: const FlDotData(show: true),
        ),
      ],
      borderData: FlBorderData(show: false),
    ));
  }
}