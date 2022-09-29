import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/data_model.dart';
import '../../view_model/data_provider.dart';


final List<Color> gradientColors = [
  const Color(0xff23b6e6),
  const Color(0xff02d39a),
];

Widget lineChart(DataProvider dataProvider) {
  return Container(
    height: 300,
    padding: const EdgeInsets.only(bottom: 50, left: 10, right: 10, top: 10),
    child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: true,
            getDrawingHorizontalLine: (value) {
              return _flLine();
            },
            getDrawingVerticalLine: (value) {
              return _flLine();
            },
          ),
          titlesData: FlTitlesData(show: false),
          lineTouchData: _lineTouchData(),
          lineBarsData: [
            _lineChartBarData(dataProvider),
          ],
        )
    ),
  );
}

List<FlSpot> _spotList(List<Date> date) {
  return date.map<FlSpot>((item) => FlSpot(item.d.toDouble(), item.c)).toList();
}

String _getDateFormat(double value) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
  var format = DateFormat('yyyy-MM-dd – kk:mm');
  var dateString = format.format(date);
  return dateString;
}

LineTouchData _lineTouchData() {
  return LineTouchData(
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.blue,
      tooltipRoundedRadius: 8,
      getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
        return lineBarsSpot.map((lineBarSpot) {
          return LineTooltipItem(
            "${_getDateFormat(lineBarSpot.x)} \nPrice: ${lineBarSpot.y}",
            const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
          );
        }).toList();
      },
    ),
  );
}

FlLine _flLine() {
  return FlLine(
    color: const Color(0xff37434d),
    strokeWidth: 0.2,
  );
}

LineChartBarData _lineChartBarData(DataProvider dataProvider) {
  List<List<Date>> dateModel = dataProvider.dateModel;
  return LineChartBarData(
    spots: _spotList(dateModel[dataProvider.selectedDate]),
    isCurved: true,
    gradient: LinearGradient(
      colors: gradientColors,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
  );
}