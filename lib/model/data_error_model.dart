import 'dart:convert';

DataError dataErrorFromJson(String str) => DataError.fromJson(json.decode(str));

class DataError {
  DataError({
    this.code,
    this.message,
  });

  int? code;
  String? message;

  factory DataError.fromJson(Map<String, dynamic> json) => DataError(
    code: json["code"],
    message: json["message"],
  );
}