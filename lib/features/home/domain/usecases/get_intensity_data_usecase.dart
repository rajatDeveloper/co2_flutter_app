import 'package:co2_flutter_app/core/error/failure.dart';
import 'package:co2_flutter_app/core/usecase/usecase.dart';
import 'package:co2_flutter_app/features/home/data/models/national_intensity_model.dart';
import 'package:co2_flutter_app/features/home/domain/repo/home_repo.dart';
import 'package:fpdart/fpdart.dart';

class GetIntensityDataUsecase
    implements UseCase<List<NationalIntensityModel>, NoParms> {
  final HomeRepo _homeRepo;
  GetIntensityDataUsecase({
    required HomeRepo homeRepo,
  }) : _homeRepo = homeRepo;

  @override
  Future<Either<Failure, List<NationalIntensityModel>>> call(
      NoParms parms) async {
    return await _homeRepo.getIntensityData();
  }
}

class NoParms {}
