import 'package:dartz/dartz.dart';
import 'package:webtask/core/error/failure.dart';
import 'package:webtask/features/home/domain/entities/news_entity.dart';

abstract class BaseGetAllNewsRepo {
  Future<Either<Failure, List<News>>> getAllNews();
}
