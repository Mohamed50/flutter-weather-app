import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/utils/icons_extension.dart';

class WeatherAnimatedIcon extends StatelessWidget {
  final String iconCode;

  const WeatherAnimatedIcon({Key? key, required this.iconCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/animations/$iconCode.json',
        fit: BoxFit.contain, width: 128);
  }
}

class WeatherIcon extends StatelessWidget {
  final double? size;
  final String iconCode;

  const WeatherIcon({Key? key, required this.iconCode, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/${IconAsset.fromIconCode(iconCode)}.svg',
      fit: BoxFit.contain,
      color: Colors.white,
      width: size ?? MediaQuery.of(context).size.width,
      height: size ?? MediaQuery.of(context).size.height /5,
      alignment: Alignment.center,
    );
  }
}
