import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/config/const.dart';
import 'package:weather_app/viewModel/day_view_model.dart';

class GradientBackground extends GetWidget<DayViewModel> {
  final Widget child;
  final EdgeInsets padding;

  const GradientBackground({
    Key? key,
    required this.child,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          child: Padding(
            padding: padding,
            child: child,
          ),
        )
      ],
    );
  }
}
