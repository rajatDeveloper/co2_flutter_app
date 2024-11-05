import 'package:co2_flutter_app/features/home/presentation/pages/home_page.dart';
import 'package:co2_flutter_app/features/home/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Map<String, Widget Function(BuildContext)> getAppRoutes() {
  Map<String, Widget Function(BuildContext)> appRoutes = {
    SplashPage.routeName: (context) => const SplashPage(),
    HomePage.routeName: (context) => const HomePage(),
  };

  return appRoutes;
}
