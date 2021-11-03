import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/widgets/header.dart';
import 'package:weather_app/view/widgets/week_tab_view.dart';
import 'package:weather_app/viewModel/weather_view_model.dart';
import 'widgets/weak_weather_widget.dart';

class HomePage extends GetWidget<WeatherViewModel> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: GradientColors.teal,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: const [
                Header(),
                Expanded(
                  child: WeekTabView()
                ),
                WeekWeatherWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
