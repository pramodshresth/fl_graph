import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:velorana/feature/chart/domain/entity/chat_entity.dart';

import '../../../../services/color_generate.dart';


/// CustomPieBar is a widget that displays a Pie chart based on the given [ChartEntity].
class CustomPieChart extends StatelessWidget {
  const CustomPieChart({super.key, required this.chartEntity});

  final ChartEntity chartEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: AspectRatio(
              aspectRatio: 0.2,
              child: PieChart(
                PieChartData(
                  sections: _pieChartSection(chartEntity),
                  // read about it in the PieChartData section
                ),
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



List<PieChartSectionData> _pieChartSection(ChartEntity data) {
  return List.generate(
    data.values.length,
        (index) {
      return PieChartSectionData(
          color: getUniqueColor(),
          value: double.parse((data.values[index].toString())),
          title: data.labels[index],
          radius: 150,
          titlePositionPercentageOffset: 0.55,
          borderSide: const BorderSide(color: Colors.red, width: 6));
    },
  );
}

