import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/data_model.dart';
import '../utils/constants.dart';

class DataRepository {
  static Future<DataModel> getData() async {
    try {
      var url = Uri.parse(datasUrl);
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        //log("TEST: ${response.body}");
        return dataFromJson(response.body);
      }
      return DataModel(the1G: [], the1H: [], the1A: [], the3A: [], the1Y: [], the5Y: []);
    } on HttpException{
      return DataModel(the1G: [], the1H: [], the1A: [], the3A: [], the1Y: [], the5Y: []);
    } on SocketException{
      return DataModel(the1G: [], the1H: [], the1A: [], the3A: [], the1Y: [], the5Y: []);
    } on FormatException {
      return DataModel(the1G: [], the1H: [], the1A: [], the3A: [], the1Y: [], the5Y: []);
    } catch (e) {
      return DataModel(the1G: [], the1H: [], the1A: [], the3A: [], the1Y: [], the5Y: []);
    }
  }
}
