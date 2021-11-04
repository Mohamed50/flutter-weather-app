import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/presenter/home_presenter.dart';
import 'package:weather_app/view/widgets/lottie_icon_button.dart';
import 'package:weather_app/viewModel/weather_view_model.dart';

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
          Expanded(
            child: GetBuilder<WeatherViewModel>(
              builder: (controller) => Text(
                controller.weather != null ? controller.weather!.timezone!.split('/').last : "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          LottieIconButton(
            onTap: () => _homePresenter.openLanguagePage(context),
            assetName: 'globe',
          ),
        ],
      ),
    );
  }
}
