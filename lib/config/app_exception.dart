class AppException implements Exception {
  final String message;
  final String prefix;

  AppException([this.message = "", this.prefix = ""]);

  @override
  String toString() {
    return "$prefix $message";
  }
}

class LocationException extends AppException {
  LocationException([String? message])
      : super(message ?? "", "Location Error:");
}

class WeatherException extends AppException {
  WeatherException([String? message])
      : super(message ?? "", "Weather Error:");
}

class APIException extends AppException {
  APIException([String? message])
      : super(message ?? "", "API Error:");
}