import 'package:dogus_app/screens/SemesterAverages/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final List semesterAverages;
  const MyBarGraph({super.key, required this.semesterAverages});

  @override
  Widget build(BuildContext context) {
    BarData mybarData = BarData(
      semester1Amount: semesterAverages[0],
      semester2Amount: semesterAverages[1],
      semester3Amount: semesterAverages[2],
      semester4Amount: semesterAverages[3],
      semester5Amount: semesterAverages[4],
      semester6Amount: semesterAverages[5],
      semester7Amount: semesterAverages[6],
    );
    mybarData.initializeBarData();
    return BarChart(
      BarChartData(
        maxY: 4,
        minY: 0,
        groupsSpace: 8, // Çubuklar arasındaki mesafeyi belirle
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTiles,
            ),
          ),
        ),
        barGroups: mybarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barsSpace: mybarData.barData.length.toDouble() / 2,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: Colors.red[500],
                    width: 15,
                    borderRadius: BorderRadius.circular(8),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 4,
                      color: Colors.red[100],
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTiles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text('1', style: style);
      break;
    case 1:
      text = Text('2', style: style);
      break;
    case 2:
      text = Text('3', style: style);
      break;
    case 3:
      text = Text('4', style: style);
      break;
    case 4:
      text = Text('5', style: style);
      break;
    case 5:
      text = Text('6', style: style);
      break;
    case 6:
      text = Text('7', style: style);
      break;
    default:
      text = Text('1', style: style);
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
