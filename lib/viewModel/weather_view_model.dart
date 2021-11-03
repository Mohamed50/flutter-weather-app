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

  List<Current>? _hours;
  List<Current>? get hours => _hours;

  WeatherViewModel(){
    _weatherService = Get.put(WeatherService());
    init();
  }

  void init(){
    _getWeatherByLatLng();
  }

  _getWeatherByLatLng() async {
    try {
      _weather = await _weatherService.getWeekForecastUsingLatLng('25.2048', '55.2708');
      _days = _weather!.daily;
      _hours = _weather!.hourly!.where((element) => isToday(element.dt!)).toList();
      update();
    }
    catch(e){
      Get.snackbar("Fetching Data", e.toString());
      print(e.toString());
    }
  }


}