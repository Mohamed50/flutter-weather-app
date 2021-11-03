import 'package:get/get.dart';
import 'package:weather_app/viewModel/weather_view_model.dart';

class Binding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => WeatherViewModel());
  }



}