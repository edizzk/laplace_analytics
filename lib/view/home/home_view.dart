import 'package:flutter/material.dart';
import 'package:laplace_analytics/model/data_model.dart';
import 'package:laplace_analytics/view/home/date_card.dart';
import 'package:laplace_analytics/view_model/data_provider.dart';
import 'package:provider/provider.dart';

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
    DataModel dataModel = dataProvider.dataModel;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        dateCard("1G", dataModel.the1G),
        dateCard("1H", dataModel.the1H),
        dateCard("1A", dataModel.the1A),
        dateCard("3A", dataModel.the3A),
        dateCard("1Y", dataModel.the1Y),
        dateCard("5Y", dataModel.the5Y),
      ],
    );
  }
}
