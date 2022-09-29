import 'package:flutter/cupertino.dart';
import 'package:laplace_analytics/model/data_error_model.dart';
import 'package:laplace_analytics/model/data_model.dart';
import 'package:laplace_analytics/repo/api_status.dart';

import '../repo/data_repo.dart';

class DataProvider extends ChangeNotifier {
  List<List<Date>> _dateModel = [];
  bool _isLoading = false;
  DataError? _dataError;
  int _selectedDate = 0;

  List<List<Date>> get dateModel => _dateModel;
  bool get isLoading => _isLoading;
  DataError? get dataError => _dataError;
  int get selectedDate => _selectedDate;

  DataProvider() {
    getData();
  }

  setDataModel(DataModel dataModel) {
    _dateModel = [];
    _dateModel.add(dataModel.the1G);
    _dateModel.add(dataModel.the1H);
    _dateModel.add(dataModel.the1A);
    _dateModel.add(dataModel.the3A);
    _dateModel.add(dataModel.the1Y);
    _dateModel.add(dataModel.the5Y);
  }

  setDataError(DataError dataError) {
    _dataError = dataError;
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setSelectedDate(int selected) {
    _selectedDate = selected;
    notifyListeners();
  }

  getData() async {
    setLoading(true);
    var response = await DataRepository.getData();
    if (response is Success) {
      setDataModel(response.response as DataModel);
    }
    if (response is Failure) {
      DataError dataError = DataError(
        code: response.code,
        message: response.errorResponse.toString()
      );
      setDataError(dataError);
    }
    setLoading(false);
  }
}