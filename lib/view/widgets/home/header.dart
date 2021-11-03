import 'package:flutter/material.dart';
import 'package:weather_app/presenter/home_presenter.dart';
import 'package:weather_app/view/widgets/lottie_icon_button.dart';

class Header extends StatelessWidget {
  final _homePresenter = HomePresenter.instance;

  Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 1,
      child: Row(
        children: [
          LottieIconButton(
            onTap: () => _homePresenter.getCurrentLocation(context),
            assetName: 'location',
          ),
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
          LottieIconButton(
            onTap: () => _homePresenter.openLanguagePage(context),
            assetName: 'location',
          ),
        ],
      ),
    );
  }
}
