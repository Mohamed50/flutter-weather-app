import 'package:get/get.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/services/weather_service.dart';
import 'package:weather_app/utils/date_time_util.dart';

class WeatherViewModel extends GetxController{
  late WeatherService _weatherService;

  WeatherModel? _weather;
  WeatherModel? get weather => _weather;

  List<Daily>? _days;
  List<Daily>? get days => _days;

  List<Current>? _todayHours;
  List<Current>? get todayHours => _todayHours;

  List<Current>? _tomorrowHours;
  List<Current>? get tomorrowHours => _tomorrowHours;


  WeatherViewModel(){
    _weatherService = Get.put(WeatherService());
  }

  getWeatherByLatLng(double lat, double lng) async {
      _weather = await _weatherService.getWeekForecastUsingLatLng(lat, lng);
      _days = _weather!.daily;
      _todayHours = _weather!.hourly!.where((element) => isToday(element.dt!)).toList();
      _weather!.hourly!.removeWhere((element) => isToday(element.dt!));
      _tomorrowHours = _weather!.hourly!.where((element) => !isAfterToday(element.dt!,1)).toList();
      update();
  }


}