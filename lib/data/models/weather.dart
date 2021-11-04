// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.hourly,
    this.daily,
  });

  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Current>? hourly;
  List<Daily>? daily;


  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
    lon: json["lon"] == null ? null : json["lon"].toDouble(),
    timezone: json["timezone"],
    timezoneOffset: json["timezone_offset"],
    current: json["current"] == null ? null : Current.fromJson(json["current"]),
    hourly: json["hourly"] == null ? null : List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
    daily: json["daily"] == null ? null : List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
    "timezone": timezone,
    "timezone_offset": timezoneOffset,
    "current": current == null ? null : current!.toJson(),
    "hourly": hourly == null ? null : List<dynamic>.from(hourly!.map((x) => x.toJson())),
    "daily": daily == null ? null : List<dynamic>.from(daily!.map((x) => x.toJson())),
  };
}

class Current {
  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.rain,
    this.pop,
  });

  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  Rain? rain;
  double? pop;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    dt: json["dt"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    temp: json["temp"] == null ? null : json["temp"].toDouble(),
    feelsLike: json["feels_like"] == null ? null : json["feels_like"].toDouble(),
    pressure: json["pressure"],
    humidity: json["humidity"],
    dewPoint: json["dew_point"] == null ? null : json["dew_point"].toDouble(),
    uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
    clouds: json["clouds"],
    visibility: json["visibility"],
    windSpeed: json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
    windDeg: json["wind_deg"],
    windGust: json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
    weather: json["weather"] == null ? null : List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
    pop: json["pop"] == null ? null : json["pop"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "sunrise": sunrise,
    "sunset": sunset,
    "temp": temp,
    "feels_like": feelsLike,
    "pressure": pressure,
    "humidity": humidity,
    "dew_point": dewPoint,
    "uvi": uvi,
    "clouds": clouds,
    "visibility": visibility,
    "wind_speed": windSpeed,
    "wind_deg": windDeg,
    "wind_gust": windGust,
    "weather": weather == null ? null : List<dynamic>.from(weather!.map((x) => x.toJson())),
    "rain": rain == null ? null : rain!.toJson(),
    "pop": pop,
  };
}

class Rain {
  Rain({
    this.the1H,
  });

  double? the1H;


  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
    the1H: json["1h"] == null ? null : json["1h"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "1h": the1H,
  };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int? id;
  String? main;
  String? description;
  String? icon;



  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}


class Daily {
  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
  });

  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  int? clouds;
  double? pop;
  double? rain;
  double? uvi;


  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
    dt: json["dt"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    moonrise: json["moonrise"],
    moonset: json["moonset"],
    moonPhase: json["moon_phase"] == null ? null : json["moon_phase"].toDouble(),
    temp: json["temp"] == null ? null : Temp.fromJson(json["temp"]),
    feelsLike: json["feels_like"] == null ? null : FeelsLike.fromJson(json["feels_like"]),
    pressure: json["pressure"],
    humidity: json["humidity"],
    dewPoint: json["dew_point"] == null ? null : json["dew_point"].toDouble(),
    windSpeed: json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
    windDeg: json["wind_deg"],
    windGust: json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
    weather: json["weather"] == null ? null : List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    clouds: json["clouds"],
    pop: json["pop"] == null ? null : json["pop"].toDouble(),
    rain: json["rain"] == null ? null : json["rain"].toDouble(),
    uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "sunrise": sunrise,
    "sunset": sunset,
    "moonrise": moonrise,
    "moonset": moonset,
    "moon_phase": moonPhase,
    "temp": temp == null ? null : temp!.toJson(),
    "feels_like": feelsLike == null ? null : feelsLike!.toJson(),
    "pressure": pressure,
    "humidity": humidity,
    "dew_point": dewPoint,
    "wind_speed": windSpeed,
    "wind_deg": windDeg,
    "wind_gust": windGust,
    "weather": weather == null ? null : List<dynamic>.from(weather!.map((x) => x.toJson())),
    "clouds": clouds,
    "pop": pop,
    "rain": rain,
    "uvi": uvi,
  };
}

class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  double? day;
  double? night;
  double? eve;
  double? morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
    day: json["day"] == null ? null : json["day"].toDouble(),
    night: json["night"] == null ? null : json["night"].toDouble(),
    eve: json["eve"] == null ? null : json["eve"].toDouble(),
    morn: json["morn"] == null ? null : json["morn"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "night": night,
    "eve": eve,
    "morn": morn,
  };
}

class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.average,
    this.night,
    this.eve,
    this.morn,
  });

  double? day;
  double? min;
  double? max;
  double? average;
  double? night;
  double? eve;
  double? morn;


  factory Temp.fromJson(Map<String, dynamic> json){
    Temp temp = Temp(
      day: json["day"] == null ? null : json["day"].toDouble(),
      min: json["min"] == null ? null : json["min"].toDouble(),
      max: json["max"] == null ? null : json["max"].toDouble(),
      night: json["night"] == null ? null : json["night"].toDouble(),
      eve: json["eve"] == null ? null : json["eve"].toDouble(),
      morn: json["morn"] == null ? null : json["morn"].toDouble(),
    );
    temp.average = (temp.min! + temp.max!) / 2;
    return temp;
  }

  Map<String, dynamic> toJson() => {
    "day": day,
    "min": min,
    "max": max,
    "night": night,
    "eve": eve,
    "morn": morn,
  };
}


