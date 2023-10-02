import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:insuline_calculator/providers/provider_reports.dart';
import 'package:provider/provider.dart';


class BarChartReportes extends StatelessWidget {
  const BarChartReportes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8,50,8,10),
            child: Container(
              height: 250,
              //razon para crecer la gráfica 
              width: 145 + 36.5*Provider.of<ReportsProvider>(context).listAvg.length,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(drawVerticalLine: false),
                  alignment: BarChartAlignment.center,
                  groupsSpace: 25,
                  barGroups:List.generate(Provider.of<ReportsProvider>(context).listAvg.length, (index){
                    return BarChartGroupData(x: Provider.of<ReportsProvider>(context).startDate.day + index, 
                      barRods: [BarChartRodData(toY: Provider.of<ReportsProvider>(context).listAvg[index], 
                      color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[1] );
                  }),
                  barTouchData: BarTouchData(
                    enabled: true,
                    handleBuiltInTouches: true,
                    touchTooltipData: BarTouchTooltipData(fitInsideVertically: false, tooltipBgColor: Theme.of(context).secondaryHeaderColor)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}