import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/utils/date_time_util.dart';
import 'package:weather_app/view/widgets/clock_widget.dart';
import 'package:weather_app/view/widgets/degree_text.dart';
import 'package:weather_app/view/widgets/icon_text.dart';
import 'package:weather_app/view/widgets/min_max_widget.dart';
import 'package:weather_app/viewModel/weather_view_model.dart';
import 'current_time_icon.dart';

class WeekTabView extends StatelessWidget {
  const WeekTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherViewModel>(
      builder: (controller) {
        WeatherModel? weather = controller.weather;
        return weather != null
            ? TabBarView(
                children: List.generate(
                  weather.daily!.length,
                  (index) {
                    Daily daily = weather.daily![index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: WeatherIcon(
                                iconCode: weather.daily![index].weather!.first.icon!,
                              ),
                            ),
                            const Expanded(child: ClockWidget()),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DegreeText(
                                degree: '${daily.temp!.average!.toInt()}',
                              ),
                              MinMaxWidget(
                                min: daily.temp!.min!.toInt(),
                                max: daily.temp!.max!.toInt(),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconText(
                                assetName: "fog",
                                value: '${daily.humidity ?? ""}%',
                              ),
                              IconText(
                                assetName: "wind",
                                value: '${daily.windSpeed ?? ""} KM/H',
                              ),
                              IconText(
                                assetName: "sun",
                                value: getHumanTime(daily.sunrise!),
                              ),
                              IconText(
                                assetName: "sunset",
                                value: getHumanTime(daily.sunset!),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            getWeakDay(daily.sunset!),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
