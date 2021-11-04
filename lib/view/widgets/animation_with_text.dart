import 'package:flutter/material.dart';
import 'tab_bar_view/weather_icon.dart';

class AnimationWithTextButton extends StatelessWidget {
  final String text;
  final String assetName;
  final GestureTapCallback onTap;

  const AnimationWithTextButton(
      {Key? key,
      required this.text,
      required this.assetName,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: WeatherAnimatedIcon(iconCode: assetName),
        ),
        const SizedBox(height: 24.0),
        InkWell(
          onTap: onTap,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
