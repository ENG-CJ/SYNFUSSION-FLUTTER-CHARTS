import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

import '../modal/exapnases.dart';
import '../modal/gdp.dart';

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  List<Expanses> myExpanses = [
    Expanses(80.50, "Jan"),
    Expanses(56.0, "Feb"),
    Expanses(23, "Mar"),
    Expanses(68.25, "Apr"),
    Expanses(19, "May"),
    Expanses(72, "Jun"),
    Expanses(35.25, "Jul"),
    Expanses(92, "Aug"),
    Expanses(110, "Sept"),
    Expanses(40, "Oct"),
    Expanses(17, "Nov"),
    Expanses(89, "Dec"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SfCartesianChart(
            legend: Legend(
              isVisible: true
            ),
            title: ChartTitle(text: "My Expanses (2022)"),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: "Month"),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            numberFormat: NumberFormat.simpleCurrency(decimalDigits: 1)),
        primaryXAxis: CategoryAxis(
          title: AxisTitle(text: "Expanses in USD")
        ),
        series: <ChartSeries>[
          BarSeries<Expanses, String>(
            xAxisName: "Expanses in USD",
            yAxisName: "Month",
            name: "Expanses",

            dataLabelSettings: DataLabelSettings(
              isVisible: true
            ),
              dataSource: myExpanses,
              xValueMapper: (Expanses expanses, _) => expanses.month,
              yValueMapper: (Expanses expanses, _) => expanses.expanse)
        ],
      )),
    );
  }
}
