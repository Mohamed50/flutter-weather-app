import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieIconButton extends StatelessWidget {
  final String assetName;
  final GestureTapCallback onTap;
  const LottieIconButton({Key? key, required this.onTap, required this.assetName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Lottie.asset(
        'assets/animations/$assetName.json',
        fit: BoxFit.contain,
        repeat: false,
      ),
    );
  }
}
