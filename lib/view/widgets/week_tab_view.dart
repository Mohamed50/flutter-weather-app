import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/view/widgets/day_widget.dart';
import 'package:weather_app/viewModel/weather_view_model.dart';

class WeekTabView extends StatelessWidget {
  const WeekTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherViewModel>(
      builder: (controller) {
        List<Daily>? days = controller.days;
        return days != null
            ? TabBarView(
                children: List.generate(
                  days.length,
                  (index) {
                    Daily day = days[index];
                    return DayWidget(
                      day: day,
                      isToday: index == 0,
                    );
                  },
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
