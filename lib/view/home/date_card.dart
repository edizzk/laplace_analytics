import 'package:flutter/material.dart';

import '../../model/data_model.dart';

Widget dateCard(String type, List<Date> date) {
  return Expanded(
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black54, width: 0.5),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () {},
          child: Text(type, textAlign: TextAlign.center),
        ),
      ),
    ),
  );
}