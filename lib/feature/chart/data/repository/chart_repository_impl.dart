import 'package:dartz/dartz.dart';
import 'package:velorana/core/failure.dart';
import 'package:velorana/feature/chart/data/datasource/chart_data_source.dart';
import 'package:velorana/feature/chart/domain/entity/chat_entity.dart';
import 'package:velorana/feature/chart/domain/repository/chart_repositiry.dart';

class ChartRepositoryImpl implements ChartRepository {
  final ChartDataSource chartDataSource;

  ChartRepositoryImpl({required this.chartDataSource});

  @override
  Either<Failure, List<ChartEntity>> getChartsData() {
    try {
      final data = chartDataSource.getChartsData();
      return Right(data);
    } catch (e) {
      return Left(Failure(message: "$e"));
    }
  }
}
