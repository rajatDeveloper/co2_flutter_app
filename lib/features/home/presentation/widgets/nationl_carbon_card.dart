import 'package:co2_flutter_app/core/const/colors.dart';
import 'package:co2_flutter_app/core/utils/use_full_functions.dart';
import 'package:co2_flutter_app/features/home/data/models/national_intensity_model.dart';
import 'package:flutter/material.dart';

class NationlCarbonCard extends StatelessWidget {
  final NationalIntensityModel model;
  const NationlCarbonCard({super.key, required this.model});

  String getMsg(String index) {
    switch (index) {
      case "very low":
        return "It's super green right now! 🌍 Time to go wild with that coffee machine ☕️.";
      case "low":
        return "It's a good time to use energy – Mother Earth approves! 🌱";
      case "moderate":
        return "It's not too bad, but maybe hold off on the laundry for now 🧺.";
      case "high":
        return "Carbon intensity is high! Maybe take a break and read a book instead 📚.";
      case "very high":
        return "Whoa! Intensity is through the roof! 🌋 Best to power down for now.";
      default:
        return "Unable to determine – maybe it’s a great time to meditate 🧘.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor1, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor1.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 1,
            offset: const Offset(3, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "National Carbon Intensity",
            style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: getFontSize(21, getDeviceWidth(context))),
          ),
          Text(
            "${model.intensity!.actual.toString()} gCO₂/kWh",
            style: TextStyle(
                color: AppColors.primaryColor1,
                fontSize: getFontSize(20, getDeviceWidth(context))),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: getDeviceWidth(context),
            height: 3,
            color: AppColors.whiteColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getDeviceWidth(context) * 0.5,
                child: Text(
                  getMsg(
                    model.intensity!.index!,
                  ),
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: getFontSize(18, getDeviceWidth(context)),
                  ),
                ),
              ),
              Container(
                width: getDeviceWidth(context) * 0.28,
                height: getDeviceWidth(context) * 0.28,
                decoration: const BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      model.intensity!.index!.toUpperCase(),
                      style: TextStyle(
                          color: AppColors.primaryColor1,
                          fontWeight: FontWeight.bold,
                          fontSize: getFontSize(20, getDeviceWidth(context))),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
