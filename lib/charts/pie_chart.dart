import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../modal/gdp.dart';

class PieChart extends StatelessWidget {
  const PieChart({super.key});
  List<GDPData> getGdpData(){
    return [
      GDPData("Africa", 2000000),
      GDPData("America", 1000000),
      GDPData("Asia", 900000),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SfCircularChart(

            title: ChartTitle(text: "GDP in Millions"),
            legend: Legend(
                isVisible: true,
                position:  LegendPosition.right

            ),
            series: <CircularSeries>[

              PieSeries<GDPData,String>(

                dataSource: getGdpData(),
                xValueMapper: (GDPData data,_)=> data.continent,
                yValueMapper: (GDPData data,_)=> data.gdp,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                ),
                dataLabelMapper: (GDPData data,_) => "${(data.gdp/1000000)*100}%",

              )
            ],
          ),
        ),
      ),
    );
  }
}
