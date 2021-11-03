import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/animations/night.json', fit: BoxFit.contain, width: 128);
  }
}
