import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/config/const.dart';
import 'package:weather_app/view/widgets/header.dart';
import 'package:weather_app/view/widgets/week_tab_view.dart';
import 'package:weather_app/viewModel/day_view_model.dart';
import 'widgets/weak_weather_widget.dart';

class HomePage extends GetWidget<DayViewModel> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        body: Stack(
          children: [
            Obx(
              () => Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradients[controller.selectedDayIndex],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: const [
                  Header(),
                  Expanded(child: WeekTabView()),
                  WeekWeatherWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
