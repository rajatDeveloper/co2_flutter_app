import 'package:co2_flutter_app/core/utils/use_full_functions.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:co2_flutter_app/core/const/colors.dart';
import 'package:co2_flutter_app/features/home/data/models/national_intensity_model.dart';

class IntensityLineChart extends StatelessWidget {
  final List<NationalIntensityModel> data;

  const IntensityLineChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: data.length * 60.0,
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            backgroundColor: AppColors.primaryColor1.withOpacity(0.2),
            gridData: const FlGridData(show: true),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.whiteColor,
                      ),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    int index = value.toInt();
                    if (index >= 0 && index < data.length) {
                      // Extract and format the time (HH:mm)
                      String time = data[index].from?.substring(11, 16) ?? '';
                      return Text(
                        time,
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppColors.whiteColor,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false), // Hide top titles
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false), // Hide right titles
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: data.asMap().entries.map((entry) {
                  int index = entry.key;
                  double y = entry.value.intensity?.actual?.toDouble() ?? 0;
                  return FlSpot(index.toDouble(), y);
                }).toList(),
                isCurved: true,
                color: AppColors.primaryColor1,
                barWidth: 2,
                dotData: const FlDotData(show: true),
                belowBarData: BarAreaData(show: false),
              ),
            ],
            minY: 0,
            maxY: data
                .map((e) => e.intensity?.actual ?? 0)
                .reduce((a, b) => a > b ? a : b)
                .toDouble(),
            borderData: FlBorderData(show: true),
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((LineBarSpot touchedSpot) {
                    final index = touchedSpot.x.toInt();
                    final actual = data[index].intensity?.actual ?? 0;
                    return LineTooltipItem(
                      'Actual: $actual\nTime: ${data[index].from?.substring(11, 16) ?? ''}',
                      TextStyle(
                          fontSize: getFontSize(12, getDeviceWidth(context)),
                          color: AppColors.whiteColor),
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
