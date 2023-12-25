import 'package:dartz/dartz.dart';
import 'package:webtask/core/error/failure.dart';
import 'package:webtask/features/home/domain/entities/news_entity.dart';
import 'package:webtask/features/home/domain/repositories/base_get_all_new_repo.dart';

class GetAllNewsUseCase   {
  final BaseGetAllNewsRepo baseGetAllNewsRepo;

  GetAllNewsUseCase(
    this.baseGetAllNewsRepo,
  );
  Future<Either<Failure, List<News>>> call() async {
    return await baseGetAllNewsRepo.getAllNews();
  }
}
