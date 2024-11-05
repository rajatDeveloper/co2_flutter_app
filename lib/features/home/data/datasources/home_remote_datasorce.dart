import 'dart:developer';

import 'package:co2_flutter_app/base/base_service.dart';
import 'package:co2_flutter_app/core/error/exception.dart';
import 'package:co2_flutter_app/features/home/data/models/national_intensity_model.dart';
import 'package:co2_flutter_app/network/api_constants.dart';
import 'package:co2_flutter_app/network/application_error.dart';
import 'package:co2_flutter_app/network/network_manager.dart';
import 'package:co2_flutter_app/network/network_request.dart';

abstract interface class HomeRemoteDataSource {
  //get national co2 index
  Future<List<NationalIntensityModel>> getNationalIntensity();

  //get grapgh data for national using date

  Future<List<NationalIntensityModel>> getGraphData({required String date});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final BaseService base;

  HomeRemoteDataSourceImpl(this.base);
  @override
  Future<List<NationalIntensityModel>> getGraphData(
      {required String date}) async {
    try {
      NetworkRequest request = NetworkRequest(
        "${ApiConstants.getGraphDataUrl}$date",
        RequestMethod.get,
        headers: base.getHeaders(),
      );

      final result = await NetworkManager.instance
          .perform<List<NationalIntensityModel>>(request);

      if (result.error != null) {
        throw ServerException(result.error!.errorMsg);
      }

      var dataMap = result.json['data'];

      List<NationalIntensityModel> data = [];
      dataMap.forEach((element) {
        data.add(NationalIntensityModel.fromMap(element));
      });
      return data;
    } on ApplicationError catch (e) {
      throw ServerException(e.errorMsg);
    } on ServerException catch (e) {
      log("catch error ${e.toString()}");
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<NationalIntensityModel>> getNationalIntensity() async {
    try {
      NetworkRequest request = NetworkRequest(
        ApiConstants.getIntensityDataUrl,
        RequestMethod.get,
        headers: base.getHeaders(),
      );

      final result = await NetworkManager.instance
          .perform<List<NationalIntensityModel>>(request);

      if (result.error != null) {
        throw ServerException(result.error!.errorMsg);
      }

      var dataMap = result.json['data'];

      List<NationalIntensityModel> data = [];
      dataMap.forEach((element) {
        data.add(NationalIntensityModel.fromMap(element));
      });
      return data;
    } on ApplicationError catch (e) {
      throw ServerException(e.errorMsg);
    } on ServerException catch (e) {
      log("catch error ${e.toString()}");
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
