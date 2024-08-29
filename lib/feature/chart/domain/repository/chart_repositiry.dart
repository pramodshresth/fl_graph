
import 'package:dartz/dartz.dart';
import 'package:velorana/feature/chart/domain/entity/chat_entity.dart';

import '../../../../core/failure.dart';

abstract class ChartRepository{
   Either<Failure,List<ChartEntity>> getChartsData();
}