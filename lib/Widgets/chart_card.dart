import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project_expense/Constants/colors.dart';
import 'package:project_expense/Data/line_chart.dart';

class Grafchart extends StatefulWidget {
  const Grafchart({super.key});

  @override
  State<Grafchart> createState() => _GrafchartState();
}

class _GrafchartState extends State<Grafchart> {
  final lineChart = LineData();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 12,
              bottom: 12,
            ),
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  handleBuiltInTouches: true,
                ),
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return lineChart.bottomTitel[value.toInt()] != null
                            ? SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Text(
                                  lineChart.bottomTitel[value.toInt()]
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: kMainColor,
                                  ),
                                ),
                              )
                            : SizedBox();
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                lineBarsData: [
                  LineChartBarData(
                    barWidth: 5,
                    isStrokeCapRound: false,
                    color: kMainColor,

                    //below the bar we can add a gradient
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            kMainColor.withOpacity(0.5),
                            Colors.transparent,
                          ]),
                    ),
                    dotData: const FlDotData(
                      show: false,
                    ),
                    spots: lineChart.sport,
                  ),
                ],
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 6,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
