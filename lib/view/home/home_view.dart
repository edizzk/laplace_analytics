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
      padding: const EdgeInsets.only(right: 50, left: 50, bottom: 20, top: 20),
      child: Column(
        children: [
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black54, width: 0.5),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                _lineChart(dateModel),
                _dateCards(dateModel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _lineChart(List<List<Date>> dateModel) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            //spots: _spotList(dateModel[selectedDate])
          )
        ]
      )
    );
  }

  Widget _dateCards(List<List<Date>> dateModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        dateCard("1G"),
        dateCard("1H"),
        dateCard("1A"),
        dateCard("3A"),
        dateCard("1Y"),
        dateCard("5Y"),
      ],
    );
  }

}
