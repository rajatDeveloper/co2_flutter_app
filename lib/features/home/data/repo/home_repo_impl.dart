// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:co2_flutter_app/core/error/exception.dart';
import 'package:co2_flutter_app/core/error/failure.dart';
import 'package:co2_flutter_app/features/home/data/datasources/home_remote_datasorce.dart';
import 'package:co2_flutter_app/features/home/data/models/national_intensity_model.dart';
import 'package:co2_flutter_app/features/home/domain/repo/home_repo.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<NationalIntensityModel>>> getGraphData(
      {required String date}) async {
    try {
      var res = await homeRemoteDataSource.getGraphData(date: date);

      return right(res);
    } on ServerException catch (e) {
      return left(Failure("Error: ${e.message}"));
    } catch (e) {
      return left(Failure("Error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<NationalIntensityModel>>>
      getIntensityData() async {
    try {
      var res = await homeRemoteDataSource.getNationalIntensity();

      return right(res);
    } on ServerException catch (e) {
      return left(Failure("Error: ${e.message}"));
    } catch (e) {
      return left(Failure("Error: ${e.toString()}"));
    }
  }
}
