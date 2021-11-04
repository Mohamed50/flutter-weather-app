import 'package:weather_app/config/keys.dart';

class AppException implements Exception {
  final String message;
  final String prefix;

  AppException([this.message = "", this.prefix = ""]);

  @override
  String toString() {
    return "$prefix: $message";
  }
}

class LocationException extends AppException {
  LocationException([String? message])
      : super(message ?? "", locationErrorTitle);
}

class WeatherException extends AppException {
  WeatherException([String? message])
      : super(message ?? "", weatherErrorTitle);
}

class APIException extends AppException {
  APIException([String? message])
      : super(message ?? "", apiErrorTitle);
}

class NetworkException extends AppException {
  NetworkException([String? message])
      : super(message ?? "", networkErrorTitle);
}