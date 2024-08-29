import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../services/color_generate.dart';
import '../../domain/entity/chat_entity.dart';

/// CustomBar is a widget that displays a Bar based on the given [ChartEntity].

class CustomBar extends StatelessWidget {
  const CustomBar({super.key, required this.chartEntity});

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
              child: BarChart(
                _showingBarSections(chartEntity),
                swapAnimationDuration: const Duration(milliseconds: 150), // Optional
                swapAnimationCurve: Curves.linear, // Optional
              ),
            ),
          ),
          Text(chartEntity.name),
        ],
      ),
    );
  }
}

BarChartData _showingBarSections(ChartEntity data) {
  return BarChartData(
      barGroups: List.generate(
        data.values.length,
        (index) {
          return BarChartGroupData(x: index, barsSpace: 10, barRods: [
            BarChartRodData(
              toY: data.values[index].toDouble(),
              gradient: LinearGradient(
                colors: [getUniqueColor(), Colors.yellow],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              width: 20,
              color: getUniqueColor(),
              borderSide: const BorderSide(color: Colors.white, width: 1),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 20,
              ),
            ),
          ]);
        },
      ),
      borderData: FlBorderData(border: const Border(bottom: BorderSide(), left: BorderSide())),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            final index = value.ceil();
            return SideTitleWidget(
              axisSide: meta.axisSide,
              space: 4,
              child: Text(data.labels[index]),
            );
          },
        )),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            final index = value.ceil();
            return SideTitleWidget(
              axisSide: meta.axisSide,
              space: 4,
              child: Text(data.values[index].toString()),
            );
          },
        )),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      // backgroundColor: getUniqueColor(),
      barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
        getTooltipColor: (_) => Colors.blueGrey,
        tooltipHorizontalAlignment: FLHorizontalAlignment.right,
        tooltipMargin: -10,
        getTooltipItem: (group, groupIndex, rod, rodIndex) => BarTooltipItem(
          data.labels[groupIndex],
          const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          children: <TextSpan>[
            TextSpan(
              text: (rod.toY - 1).toString(),
              style: const TextStyle(
                color: Colors.red, //widget.touchedBarColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      )));
}
