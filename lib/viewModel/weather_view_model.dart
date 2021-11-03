import 'package:get/get.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/services/weather_service.dart';

class WeatherViewModel extends GetxController{
  late WeatherService _weatherService;

  WeatherModel? _weather;
  WeatherModel? get weather => _weather;

  WeatherViewModel(){
    _weatherService = Get.put(WeatherService());
    init();
  }

  void init(){
    _getWeatherByLatLng();
  }

  _getWeatherByLatLng() async {
    _weather = await _weatherService.getWeekForecastUsingLatLng('25.2048','55.2708');
    update();
  }


}