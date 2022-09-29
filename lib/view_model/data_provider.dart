import 'package:flutter/cupertino.dart';
import 'package:laplace_analytics/model/data_model.dart';

import '../repo/data_repo.dart';

class DataProvider extends ChangeNotifier {
  DataModel _dataModel = DataModel(the1G: [], the1H: [], the1A: [], the3A: [], the1Y: [], the5Y: []);
  bool _isLoading = false;

  DataModel get dataModel => _dataModel;
  bool get isLoading => _isLoading;

  DataProvider() {
    getData();
  }

  setDataModel(DataModel dataModel) {
    _dataModel = dataModel;
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  getData() async {
    setLoading(true);
    var response = await DataRepository.getData();
    setDataModel(response);
    setLoading(false);
  }
}