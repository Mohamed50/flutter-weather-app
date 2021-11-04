import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/config/const.dart';
import 'package:weather_app/presenter/home_presenter.dart';
import 'package:weather_app/view/widgets/animation_with_text.dart';
import 'package:weather_app/view/widgets/tab_bar_view/weather_icon.dart';
import 'package:weather_app/viewModel/internet_view_model.dart';

class SplashPage extends GetWidget<InternetViewModel> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initSplash();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradients.first,
          ),
        ),
        child: Obx(
          () {
            if (controller.isConnected()) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AspectRatio(
                    aspectRatio: 1,
                    child: WeatherAnimatedIcon(iconCode: 'night'),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    "Weather App",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700),
                  )
                ],
              );
            } else {
              return AnimationWithTextButton(
                assetName: 'internet',
                text: "No internet connection please try again",
                onTap: initSplash,
              );
            }
          },
        ),
      ),
    );
  }

  void initSplash() {
    HomePresenter.instance.initSplash();
  }
}
