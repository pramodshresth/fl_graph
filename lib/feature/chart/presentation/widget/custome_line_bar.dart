import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/chat_entity.dart';

/// CustomLineBar is a widget that displays a line chart based on the given [ChartEntity].
class CustomLineBar extends StatelessWidget {
  const CustomLineBar({super.key, required this.chartEntity});

  final ChartEntity chartEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: 400,
            child: AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                _lineChartData(chartEntity),
                duration: const Duration(milliseconds: 150), // Optional
                curve: Curves.linear, // Optional
              ),
            ),
          ),
          Text(chartEntity.name),
        ],
      ),
    );
  }
}


/// Creates a [LineChartData] object that configures the appearance and behavior
/// of the line chart based on the provided [ChartEntity].
LineChartData _lineChartData(ChartEntity data){
  return LineChartData(
    gridData: const FlGridData(show: true),
    titlesData: FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 42,
          interval: 1,
          getTitlesWidget: (value, meta) {
            final index = value.toInt();
            if (index < 0 || index >= data.labels.length) return Container();
            return Text(
              data.labels[index],
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
            );
          },
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: 0,
    maxX: (data.labels.length - 1).toDouble(),
    minY: 0,
    maxY: (data.values).reduce((a, b) => a > b ? a : b).toDouble(),
    lineBarsData: [
      LineChartBarData(
        spots: List.generate(data.labels.length, (index) {
          return FlSpot(index.toDouble(), (data.values[index]).toDouble());
        }),
        isCurved: true,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
      ),
    ],
  );
}

