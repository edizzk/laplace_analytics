import 'package:flutter/material.dart';
import 'package:laplace_analytics/view_model/data_provider.dart';

Widget dateCard(int type, DataProvider dataProvider) {

  String getString() {
    switch (type) {
      case 0:
        return "1G";
      case 1:
        return "1H";
      case 2:
        return "1A";
      case 3:
        return "3A";
      case 4:
        return "1Y";
      case 5:
        return "5Y";
      default:
        return "";
    }
  }

  String typeString = getString();

  return Expanded(
    child: InkWell(
      onTap: () => dataProvider.setSelectedDate(type),
      child: Card(
        color: type == dataProvider.selectedDate ? Colors.blue : Colors.white54,
        elevation: 10,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black54, width: 0.5),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(typeString, textAlign: TextAlign.center),
        ),
      ),
    ),
  );
}