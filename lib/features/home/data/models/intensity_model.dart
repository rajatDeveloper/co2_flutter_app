import 'dart:convert';

class IntensityModel {
  //Structure of json response from API
  // "intensity": {
  //             "forecast": 243,
  //             "actual": 243,
  //             "index": "high"
  //         }

  int? forecast;
  int? actual;
  String? index;

  IntensityModel({
    this.forecast,
    this.actual,
    this.index,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'forecast': forecast,
      'actual': actual,
      'index': index,
    };
  }

  factory IntensityModel.fromMap(Map<String, dynamic> map) {
    return IntensityModel(
      forecast: map['forecast'] != null ? map['forecast'] as int : null,
      actual: map['actual'] != null ? map['actual'] as int : null,
      index: map['index'] != null ? map['index'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory IntensityModel.fromJson(String source) =>
      IntensityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
