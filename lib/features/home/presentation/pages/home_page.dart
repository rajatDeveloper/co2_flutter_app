import 'package:co2_flutter_app/core/const/colors.dart';
import 'package:co2_flutter_app/core/utils/use_full_functions.dart';
import 'package:co2_flutter_app/features/home/presentation/bloc/bloc/get_intensity_bloc.dart';
import 'package:co2_flutter_app/features/home/presentation/bloc/get_graph_bloc/get_graph_bloc.dart';
import 'package:co2_flutter_app/features/home/presentation/widgets/custom_appbar.dart';
import 'package:co2_flutter_app/features/home/presentation/widgets/graph_card.dart';
import 'package:co2_flutter_app/features/home/presentation/widgets/nationl_carbon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:co2_flutter_app/features/home/data/models/national_intensity_model.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Fetch the initial data from bloc
  void getData() {
    context.read<GetIntensityBloc>().add(GetIntensityDataInitialEvent());
    context.read<GetGraphBloc>().add(GetGraphDataEvent());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          // Make the whole screen scrollable
          child: Column(
            children: [
              const CustomAppBar(title: "Carbon Buddy 👻"),
              BlocConsumer<GetIntensityBloc, GetIntensityState>(
                listener: (context, state) {
                  if (state is GetIntensityError) {
                    showSnackBar(context, state.message);
                  }
                },
                builder: (context, state) {
                  if (state is GetIntensitySuccess) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Reload the data:",
                                  style: TextStyle(
                                    color: AppColors.primaryColor1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getFontSize(
                                        20, getDeviceWidth(context)),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<GetIntensityBloc>()
                                        .add(GetIntensityDataInitialEvent());
                                    context
                                        .read<GetGraphBloc>()
                                        .add(GetGraphDataEvent());
                                  },
                                  icon: const Icon(Icons.refresh),
                                  color: AppColors.primaryColor1,
                                ),
                              ],
                            ),
                          ),
                          NationlCarbonCard(model: state.intensity),
                        ],
                      ),
                    );
                  }
                  return SizedBox(
                    height: getDeviceHeight(context) * 0.3,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
              BlocConsumer<GetGraphBloc, GetGraphState>(
                listener: (context, state) {
                  if (state is GetGraphError) {
                    showSnackBar(context, state.message);
                  }
                },
                builder: (context, state) {
                  if (state is GetGraphSuccess) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "National half-hourly carbon intensity for the current day.",
                            style: TextStyle(
                              color: AppColors.primaryColor1,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  getFontSize(20, getDeviceWidth(context)),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              width: state.data.length *
                                  60.0, // Adjust width for scrollable area
                              height: getDeviceHeight(context) * 0.48,
                              child: IntensityLineChart(data: state.data),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Visibility(
                    visible: state is! GetGraphLoading,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
