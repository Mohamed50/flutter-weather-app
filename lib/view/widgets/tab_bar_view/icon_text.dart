import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconText extends StatelessWidget {
  final String assetName;
  final String? value;
  final Widget? child;

  const IconText({Key? key, required this.assetName, this.value, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/icons/$assetName.svg",
          width: 24.0,
          height: 24.0,
          fit: BoxFit.scaleDown,
          color: Colors.white,
        ),
        child ??
            Text(
              value ?? "",
              style:
                  const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w200),
              textAlign: TextAlign.end,
            ),
      ],
    );
  }
}
