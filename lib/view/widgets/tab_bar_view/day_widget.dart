import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:weather_app/config/lang/keys.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/utils/date_time_util.dart';
import 'degree_text.dart';
import 'hourly_list.dart';
import 'icon_text.dart';
import 'min_max_widget.dart';
import 'weather_icon.dart';

class DayWidget extends StatelessWidget {
  final Daily day;
  final bool isToday;
  const DayWidget({Key? key, required this.day, this.isToday = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WeatherIcon(iconCode: day.weather!.first.icon!,),
        Text(day.weather!.first.description!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DegreeText(
                degree: '${day.temp!.average!.toInt()}',
              ),
              MinMaxWidget(
                min: day.temp!.min!.toInt(),
                max: day.temp!.max!.toInt(),
              ),
            ],
          ),
        ),
        isToday ? const HourlyWidget() : Container(),
        SizedBox(
          height: 32.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconText(
                assetName: "fog",
                value: '${day.humidity ?? ""}%',
              ),
              IconText(
                assetName: "wind",
                value: '${day.windSpeed ?? ""} KM/H',
              ),
              IconText(
                assetName: "sun",
                value: getReadableTime(day.sunrise!),
              ),
              IconText(
                assetName: "sunset",
                value: getReadableTime(day.sunset!),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            !isToday
                ? getWeakDay(day.sunset!)
                : todayMessage.tr,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
