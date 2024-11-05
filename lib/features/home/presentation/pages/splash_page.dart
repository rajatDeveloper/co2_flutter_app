// ignore_for_file: use_build_context_synchronously

import 'package:co2_flutter_app/core/const/colors.dart';
import 'package:co2_flutter_app/core/utils/use_full_functions.dart';
import 'package:co2_flutter_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash-page';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  handleNavigation() async {
    //2 sec wait
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushNamed(context, HomePage.routeName);
  }

  @override
  void initState() {
    super.initState();
    //splash screen delay
    handleNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Carbon Buddy',
                style: TextStyle(
                    color: AppColors.primaryColor1,
                    fontWeight: FontWeight.bold,
                    fontSize: getFontSize(35, getDeviceWidth(context))),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.01,
              ),
              Text(
                "👻",
                style: TextStyle(
                    fontSize: getFontSize(40, getDeviceWidth(context))),
              )
            ],
          ),
        ));
  }
}
