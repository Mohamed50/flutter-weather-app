import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/config/keys.dart';
import 'package:weather_app/presenter/home_presenter.dart';
import 'package:weather_app/view/widgets/animation_with_text.dart';
import 'package:weather_app/viewModel/location_view_model.dart';

class LocationChecker extends StatelessWidget {
  final Widget child;

  const LocationChecker({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationViewModel>(
      builder: (controller) =>
      controller.hasLocationData
          ? child
          : AnimationWithTextButton(
        text: locationNotSetMessage.tr,
        assetName: 'location',
        onTap: () {
          HomePresenter.instance.getCurrentLocation(context);
        },
      ),
    );
  }
}
