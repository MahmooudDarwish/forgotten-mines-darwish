import 'package:dartz/dartz.dart';
import 'package:webtask/core/error/exceptions.dart';
import 'package:webtask/core/error/failure.dart';
import 'package:webtask/features/home/data/data_sources/get_all_news_data_source.dart';
import 'package:webtask/features/home/domain/entities/news_entity.dart';
import 'package:webtask/features/home/domain/repositories/base_get_all_new_repo.dart';

class GetAllNewsRepo extends BaseGetAllNewsRepo {
  BaseGetAllNewsDataSource baseGetAllNewsDataSource;
  GetAllNewsRepo(this.baseGetAllNewsDataSource);

  @override
  Future<Either<Failure, List<News>>> getAllNews() async {
    final result = await baseGetAllNewsDataSource.getAllNews();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
