import 'package:get/get.dart';
import 'package:weather_app/data/config/api_config.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/utils/get_utils.dart';

class WeatherService extends GetConnect{

  Future<WeatherModel> getWeekForecastUsingLatLng(double lat, double lng) async {
    Response response = await get(
      '$WEEK_FORECAST_URL&lat=$lat&lon=$lng&exclude=minutely&units=metric&lang=${Get.locale!.languageCode}',
    );
    logRequestData(response);
    handleError(response);
    return WeatherModel.fromJson(response.body);
  }

}