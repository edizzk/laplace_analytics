import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/data_model.dart';
import '../utils/constants.dart';
import 'api_status.dart';

class DataRepository {
  static Future<Object> getData() async {
    try {
      var url = Uri.parse(datasUrl);
      var response = await http.get(url, headers: headers);
      if (response.statusCode == SUCCESS) {
        //log("TEST: ${response.body}");
        return Success(response: dataFromJson(response.body));
      }
      return Failure(code: INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException{
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException{
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
