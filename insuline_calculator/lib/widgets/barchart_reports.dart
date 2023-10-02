import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


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
              width: 145 + 36.5*30,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(drawVerticalLine: false),
                  alignment: BarChartAlignment.center,

                  groupsSpace: 25,
                  barGroups: [
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[1] ),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 18,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[2] ),
                    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 4,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[3] ),
                    BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 12,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[4] ),
                    BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 13,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[5] ),
                    BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 10,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[6] ),
                    BarChartGroupData(x: 7, barRods: [BarChartRodData(toY: 18,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[7] ),
                    BarChartGroupData(x: 8, barRods: [BarChartRodData(toY: 4,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[8] ),
                    BarChartGroupData(x: 9, barRods: [BarChartRodData(toY: 12,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[9] ),
                    BarChartGroupData(x: 10, barRods: [BarChartRodData(toY: 4,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[10] ),
                    BarChartGroupData(x: 11, barRods: [BarChartRodData(toY: 10,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[11] ),
                    BarChartGroupData(x: 12, barRods: [BarChartRodData(toY: 18,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[12] ),
                    BarChartGroupData(x: 13, barRods: [BarChartRodData(toY: 4,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[13] ),
                    BarChartGroupData(x: 14, barRods: [BarChartRodData(toY: 12,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[14] ),
                    BarChartGroupData(x: 15, barRods: [BarChartRodData(toY: 4,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[15] ),
                    BarChartGroupData(x: 16, barRods: [BarChartRodData(toY: 17,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[16] ),
                    BarChartGroupData(x: 17, barRods: [BarChartRodData(toY: 18,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[17] ),
                    BarChartGroupData(x: 18, barRods: [BarChartRodData(toY: 4,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[18] ),
                    BarChartGroupData(x: 19, barRods: [BarChartRodData(toY: 12,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[19] ),
                    BarChartGroupData(x: 20, barRods: [BarChartRodData(toY: 13,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[20] ),
                    BarChartGroupData(x: 21, barRods: [BarChartRodData(toY: 10,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[21] ),
                    BarChartGroupData(x: 22, barRods: [BarChartRodData(toY: 18,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[22] ),
                    BarChartGroupData(x: 23, barRods: [BarChartRodData(toY: 4,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[23] ),
                    BarChartGroupData(x: 24, barRods: [BarChartRodData(toY: 12,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[24] ),
                    BarChartGroupData(x: 25, barRods: [BarChartRodData(toY: 4,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[25] ),
                    BarChartGroupData(x: 26, barRods: [BarChartRodData(toY: 10,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[26] ),
                    BarChartGroupData(x: 27, barRods: [BarChartRodData(toY: 18,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[27] ),
                    BarChartGroupData(x: 28, barRods: [BarChartRodData(toY: 4,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[28] ),
                    BarChartGroupData(x: 29, barRods: [BarChartRodData(toY: 12,color:Theme.of(context).primaryColor, width: 12)], showingTooltipIndicators:[29] ),
                    BarChartGroupData(x: 30, barRods: [BarChartRodData(toY: 4,color:Theme.of(context).primaryColor, width: 12,)], showingTooltipIndicators:[30] ),
                    
                  ],
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