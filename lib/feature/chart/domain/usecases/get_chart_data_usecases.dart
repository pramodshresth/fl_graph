import 'package:dartz/dartz.dart';
import 'package:velorana/feature/chart/domain/entity/chat_entity.dart';
import 'package:velorana/feature/chart/domain/repository/chart_repositiry.dart';

import '../../../../core/failure.dart';


/// Use case for retrieving chart data.
class GetChartDataUsecases {
  final ChartRepository chartRepository;

  GetChartDataUsecases({required this.chartRepository});

  Either<Failure, List<ChartEntity>> call() {
    return chartRepository.getChartsData();
  }
}
