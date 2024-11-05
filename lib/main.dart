import 'package:co2_flutter_app/core/const/colors.dart';
import 'package:co2_flutter_app/core/utils/router.dart';
import 'package:co2_flutter_app/features/home/presentation/bloc/bloc/get_intensity_bloc.dart';
import 'package:co2_flutter_app/features/home/presentation/bloc/get_graph_bloc/get_graph_bloc.dart';
import 'package:co2_flutter_app/features/home/presentation/pages/splash_page.dart';
import 'package:co2_flutter_app/initial_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<GetGraphBloc>()),
      BlocProvider(create: (_) => serviceLocator<GetIntensityBloc>())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbon Buddy',
      debugShowCheckedModeBanner: false,
      routes: getAppRoutes(),
      initialRoute: SplashPage.routeName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor1),
        useMaterial3: true,
      ),
    );
  }
}
