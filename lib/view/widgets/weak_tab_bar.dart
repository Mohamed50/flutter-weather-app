import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/view/widgets/degree_text.dart';
import 'package:weather_app/view/widgets/weather_icon.dart';
import 'package:weather_app/viewModel/day_view_model.dart';
import 'package:weather_app/viewModel/weather_view_model.dart';

class WeekTabBar extends StatelessWidget {
  final TabController tabController;

  const WeekTabBar({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dayViewModel = Get.find<DayViewModel>();
    return GetBuilder<WeatherViewModel>(
      builder: (controller) {
        WeatherModel? weather = controller.weather;
        return weather != null
            ? TabBar(
                controller: tabController,
                labelColor: Colors.black,
                onTap: dayViewModel.onTabViewChanged,
                unselectedLabelColor: Colors.grey[800],
                isScrollable: true,
                indicator: BoxDecoration(
                  gradient: const LinearGradient(colors: GradientColors.white),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                tabs: List.generate(
                  weather.daily!.length,
                  (index) => Tab(
                    icon: WeatherIcon(iconCode: weather.daily![index].weather!.first.icon!,size: 24.0,color: Colors.black,),
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
