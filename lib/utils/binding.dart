import 'package:get/get.dart';
import 'package:weather_app/viewModel/clock_view_model.dart';
import 'package:weather_app/viewModel/day_view_model.dart';
import 'package:weather_app/viewModel/location_view_model.dart';
import 'package:weather_app/viewModel/weather_view_model.dart';

class Binding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => LocationViewModel());
    Get.lazyPut(() => WeatherViewModel());
    Get.lazyPut(() => ClockViewModel());
    Get.lazyPut(() => DayViewModel());
  }



}