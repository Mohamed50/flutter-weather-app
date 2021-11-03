import 'package:flutter/material.dart';
import 'package:weather_app/view/widgets/tab_bar_view/icon_text.dart';
import 'degree_text.dart';

class MinMaxWidget extends StatelessWidget {
  final int min;
  final int max;

  const MinMaxWidget({Key? key, required this.min, required this.max})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconText(
      assetName: 'temp',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DegreeText(
            degree: min.toString(),
            fontSize: 10.0,
          ),
          const Text(' / '),
          DegreeText(
            degree: max.toString(),
            fontSize: 10.0,
          ),
        ],
      ),
    );
  }
}
