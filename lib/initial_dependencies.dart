import 'package:co2_flutter_app/base/base_service.dart';
import 'package:co2_flutter_app/features/home/data/datasources/home_remote_datasorce.dart';
import 'package:co2_flutter_app/features/home/data/repo/home_repo_impl.dart';
import 'package:co2_flutter_app/features/home/domain/repo/home_repo.dart';
import 'package:co2_flutter_app/features/home/domain/usecases/get_graph_data_usecase.dart';
import 'package:co2_flutter_app/features/home/domain/usecases/get_intensity_data_usecase.dart';
import 'package:co2_flutter_app/features/home/presentation/bloc/bloc/get_intensity_bloc.dart';
import 'package:co2_flutter_app/features/home/presentation/bloc/get_graph_bloc/get_graph_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initialDependencies() async {
  _initHome();
}

void _initHome() {
  serviceLocator
    //Data Sorce
    ..registerFactory<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(BaseService()))

    //Repository
    ..registerFactory<HomeRepo>(
        () => HomeRepoImpl(homeRemoteDataSource: serviceLocator()))

    //Usecase
    ..registerFactory<GetGraphDataUsecase>(
        () => GetGraphDataUsecase(homeRepo: serviceLocator()))
    ..registerFactory<GetIntensityDataUsecase>(
        () => GetIntensityDataUsecase(homeRepo: serviceLocator()))

    //Bloc
    ..registerLazySingleton(
        () => GetGraphBloc(getGraphDataUsecase: serviceLocator()))
    ..registerLazySingleton(
        () => GetIntensityBloc(getIntensityDataUsecase: serviceLocator()));
}
