import 'package:flutter/material.dart';

class DegreeText extends StatelessWidget {
  final String degree;
  final double fontSize;
  const DegreeText({Key? key, required this.degree, this.fontSize = 128}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
         degree,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        Container(
          padding: EdgeInsets.all(fontSize / 16),
          margin: EdgeInsets.symmetric(vertical: fontSize / 8),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: fontSize / 18)
          ),
        )
      ],
    );
  }
}
