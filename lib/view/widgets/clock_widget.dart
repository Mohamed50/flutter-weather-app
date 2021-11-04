import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/viewModel/clock_view_model.dart';

class ClockWidget extends GetWidget<ClockViewModel> {
  final TextStyle _textStyle =
      const TextStyle(fontSize: 40.0, fontWeight: FontWeight.w700, color: Colors.white);

  const ClockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Text(
              '${formatNumber(controller.currentTime.hour)}:',
              style: _textStyle,
            ),
            Text(
              '${formatNumber(controller.currentTime.minute)}:',
              style: _textStyle,
            ),
            Text(
              formatNumber(controller.currentTime.second),
              style: _textStyle,
            )
          ],
        ));
  }

  String formatNumber(int number) {
    if (number >= 0 && number < 9) {
      return '0$number';
    }
    return '$number';
  }
}
