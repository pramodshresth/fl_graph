import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:velorana/feature/chart/data/datasource/chart_data_source.dart';
import 'package:velorana/feature/chart/data/repository/chart_repository_impl.dart';
import 'package:velorana/feature/chart/domain/usecases/get_chart_data_usecases.dart';
import 'package:velorana/feature/chart/presentation/widget/custom_pie_chart.dart';
import 'package:velorana/feature/chart/presentation/widget/custome_bar.dart';
import 'package:velorana/feature/chart/presentation/widget/custome_line_bar.dart';

import '../../domain/entity/chat_entity.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<ChartEntity> chartsData = [];
  late GetChartDataUsecases getChartDataUsecases;

  @override
  void initState() {
    // TODO: implement initState
    getChartDataUsecases = GetChartDataUsecases(
        chartRepository: ChartRepositoryImpl(chartDataSource: ChartDataSource()));
    _getChartsData();
    super.initState();
  }

  _getChartsData() {
    final response = getChartDataUsecases();
    response.fold((error) {}, (data) => chartsData = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: chartsData.map((e) {
              if (e.type == "pie") {
                return CustomPieChart(chartEntity: e);
              }
              if (e.type == "bar") {
                return CustomBar(chartEntity: e);
              }
              if (e.type == "line") {
                return CustomLineBar(chartEntity: e);
              }
              return const SizedBox();
            }).toList(),
          ),
        ),
      ),
    );
  }
}
