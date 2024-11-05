// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:co2_flutter_app/features/home/data/models/intensity_model.dart';

class NationalIntensityModel {
  // {
  //         "from": "2024-11-05T03:30Z",
  //         "to": "2024-11-05T04:00Z",
  //         "intensity": {
  //             "forecast": 243,
  //             "actual": 243,
  //             "index": "high"
  //         }
  //     }

  String? from;
  String? to;
  IntensityModel? intensity;

  NationalIntensityModel({
    this.from,
    this.to,
    this.intensity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from,
      'to': to,
      'intensity': intensity?.toMap(),
    };
  }

  factory NationalIntensityModel.fromMap(Map<String, dynamic> map) {
    return NationalIntensityModel(
      from: map['from'] != null ? map['from'] as String : null,
      to: map['to'] != null ? map['to'] as String : null,
      intensity: map['intensity'] != null
          ? IntensityModel.fromMap(map['intensity'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NationalIntensityModel.fromJson(String source) =>
      NationalIntensityModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
