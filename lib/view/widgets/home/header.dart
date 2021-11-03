import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9/1,
      child: Row(
        children: [
          Lottie.asset('assets/animations/location.json', fit: BoxFit.contain, repeat: false),
          const Expanded(
            child: Text(
              "Dubai",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
            ),
          ),
          Lottie.asset('assets/animations/globe.json', fit: BoxFit.contain, repeat: false),
        ],
      ),
    );
  }
}
