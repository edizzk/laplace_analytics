import 'dart:convert';

DataModel dataFromJson(String str) => DataModel.fromJson(json.decode(str));

class DataModel {
  DataModel({
    required this.the1G,
    required this.the1H,
    required this.the1A,
    required this.the3A,
    required this.the1Y,
    required this.the5Y,
  });

  List<Date> the1G;
  List<Date> the1H;
  List<Date> the1A;
  List<Date> the3A;
  List<Date> the1Y;
  List<Date> the5Y;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    the1G: List<Date>.from(json["1G"].map((x) => Date.fromJson(x))),
    the1H: List<Date>.from(json["1H"].map((x) => Date.fromJson(x))),
    the1A: List<Date>.from(json["1A"].map((x) => Date.fromJson(x))),
    the3A: List<Date>.from(json["3A"].map((x) => Date.fromJson(x))),
    the1Y: List<Date>.from(json["1Y"].map((x) => Date.fromJson(x))),
    the5Y: List<Date>.from(json["5Y"].map((x) => Date.fromJson(x))),
  );
}

class Date {
  Date({
    required this.d,
    required this.c,
  });

  int d;
  double c;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    d: json["d"],
    c: json["c"].toDouble(),
  );
}
