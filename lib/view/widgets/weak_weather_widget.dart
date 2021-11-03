import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/view/widgets/degree_text.dart';
import 'package:weather_app/viewModel/day_view_model.dart';
import 'package:weather_app/viewModel/weather_view_model.dart';

class WeekWeatherWidget extends StatelessWidget {
  const WeekWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dayViewModel = Get.find<DayViewModel>();
    return GetBuilder<WeatherViewModel>(
      builder: (controller) {
        WeatherModel? weather = controller.weather;
        return weather != null
            ? TabBar(
                labelColor: Colors.black,onTap: dayViewModel.onTabViewChanged,
                unselectedLabelColor: Colors.grey[800],
                isScrollable: true,
                indicator: BoxDecoration(
                  gradient: const LinearGradient(colors: GradientColors.white),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                tabs: List.generate(
                  weather.daily!.length,
                  (index) => Tab(
                    icon: Lottie.asset('assets/animations/night.json',
                        fit: BoxFit.fitHeight,
                        height: 24.0,
                        width: 24.0,
                        alignment: Alignment.center),
                    child: DegreeText(
                        degree: weather.daily![index].temp!.average!
                            .toInt()
                            .toString(),
                        fontSize: 12.0),
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
