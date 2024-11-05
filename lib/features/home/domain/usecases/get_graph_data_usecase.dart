// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:co2_flutter_app/core/error/failure.dart';
import 'package:co2_flutter_app/core/usecase/usecase.dart';
import 'package:co2_flutter_app/features/home/data/models/national_intensity_model.dart';
import 'package:co2_flutter_app/features/home/domain/repo/home_repo.dart';
import 'package:fpdart/src/either.dart';

class GetGraphDataUsecase
    implements UseCase<List<NationalIntensityModel>, GraphParams> {
  final HomeRepo _homeRepo;
  GetGraphDataUsecase({
    required HomeRepo homeRepo,
  }) : _homeRepo = homeRepo;

  @override
  Future<Either<Failure, List<NationalIntensityModel>>> call(
      GraphParams parms) async {
    return await _homeRepo.getGraphData(date: parms.date);
  }
}

class GraphParams {
  String date;
  GraphParams({
    required this.date,
  });
}
