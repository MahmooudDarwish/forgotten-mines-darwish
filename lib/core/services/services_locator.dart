import 'package:get_it/get_it.dart';
import 'package:webtask/features/home/data/data_sources/get_all_news_data_source.dart';
import 'package:webtask/features/home/data/repositories/get_all_news_repo.dart';
import 'package:webtask/features/home/domain/repositories/base_get_all_new_repo.dart';
import 'package:webtask/features/home/domain/use_cases/get_all_news_use_case.dart';
import 'package:webtask/features/home/presentation/manager/home_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Go router
    //sl.registerLazySingleton<GoRouter>(() => GoRouter(routes: Routes.routes));

    ///Dio helper
    ///Shared prefernces

    /// DATA SOURCE
    sl.registerLazySingleton<BaseGetAllNewsDataSource>(
        () => GetAllNewsDataSource());

    /// Repository
    sl.registerLazySingleton<BaseGetAllNewsRepo>(() => GetAllNewsRepo(sl()));

    /// Use Cases
    sl.registerLazySingleton<GetAllNewsUseCase>(() => GetAllNewsUseCase(sl()));

    /// Bloc
    sl.registerLazySingleton<HomeBloc>(() => HomeBloc(sl()));

    ///Cubit
  }
}
