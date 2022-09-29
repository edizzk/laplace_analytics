/// Api Url
const String datasUrl = "https://finfree.app/demo";
const Map<String, String> headers = {
  "Content-Type": "application/json",
  "Accept": "application/json",
  "Authorization": "R29vZCBMdWNr",
};

/// Errors
const INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;

const SUCCESS = 200;