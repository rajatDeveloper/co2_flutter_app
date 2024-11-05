import 'package:co2_flutter_app/core/error/failure.dart';
import 'package:co2_flutter_app/features/home/data/models/national_intensity_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class HomeRepo {
  // Function to get national intensity data
  Future<Either<Failure, List<NationalIntensityModel>>> getIntensityData();
  // Function to get graph data
  Future<Either<Failure, List<NationalIntensityModel>>> getGraphData(
      {required String date});
}
