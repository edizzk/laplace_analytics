import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:laplace_analytics/model/data_model.dart';
import 'package:laplace_analytics/view/home/date_card.dart';
import 'package:laplace_analytics/view_model/data_provider.dart';
import 'package:provider/provider.dart';

import '../../widget/app_loading.dart';
import '../../widget/failure_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = context.watch<DataProvider>();
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: _ui(dataProvider),
    );
  }

  Widget _ui(DataProvider dataProvider) {
    if (dataProvider.isLoading) {
      return const AppLoading();
    }
    if (dataProvider.dataError?.code != null) {
      return FailureBox(text: dataProvider.dataError?.message);
    }
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5, bottom: 20, top: 20),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black54, width: 0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            _lineChart(dataProvider),
            _dateCards(dataProvider),
          ],
        ),
      ),
    );
  }

  Widget _lineChart(DataProvider dataProvider) {
    List<List<Date>> dateModel = dataProvider.dateModel;
    return Container(
      height: 300,
      padding: const EdgeInsets.only(bottom: 40),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: _spotList(dateModel[dataProvider.selectedDate])
            )
          ]
        )
      ),
    );
  }

  Widget _dateCards(DataProvider dataProvider) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i=0; i<=5; i++)
            dateCard(i, dataProvider)
        ],
      ),
    );
  }

  List<FlSpot> _spotList(List<Date> date) {
    return date.map<FlSpot>((item) => FlSpot(item.d.toDouble(), item.c)).toList();
  }

}
