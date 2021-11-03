import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/utils/date_time_util.dart';
import 'package:weather_app/utils/icons_extension.dart';
import 'package:weather_app/view/widgets/degree_text.dart';
import 'package:weather_app/view/widgets/icon_text.dart';
import 'package:weather_app/viewModel/weather_view_model.dart';

class HourlyWidget extends StatelessWidget {

  const HourlyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherViewModel>(
      builder: (controller){
        List<Current>? hours = controller.hours;
        return hours != null ? Container(
          height: 48,
          alignment: Alignment.center,
          child: ListView.separated(
            itemCount: hours.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconText(
                        assetName: IconAsset.fromIconCode(
                            hours[index].weather!.first.icon!),
                        child: DegreeText(
                          degree: hours[index].temp!.toInt().toString(),
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  ),
                  Text(getReadableTime(hours[index].dt!))
                ],
              ),
            ),
            separatorBuilder: (context, index) => const Divider(),
          ),
        ) : Container();
      },
    );
  }
}
