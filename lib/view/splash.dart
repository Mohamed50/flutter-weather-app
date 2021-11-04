import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/config/keys.dart';
import 'package:weather_app/presenter/home_presenter.dart';
import 'package:weather_app/view/widgets/animation_with_text.dart';
import 'package:weather_app/view/widgets/home/gradient_background.dart';
import 'package:weather_app/viewModel/internet_view_model.dart';

class SplashPage extends GetWidget<InternetViewModel> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initSplash();
    return Scaffold(
      body: GradientBackground(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () {
            if (controller.isConnected()) {
              return AnimationWithTextButton(
                assetName: 'night',
                text: appName.tr,
                onTap: (){},
              );
            } else {
              return AnimationWithTextButton(
                assetName: 'internet',
                text: noInternetTryAgainMessage.tr,
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
