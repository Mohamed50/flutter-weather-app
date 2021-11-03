import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/src/overlay_controller_widget_extension.dart';
import 'package:weather_app/config/app_exception.dart';
import 'package:weather_app/viewModel/location_view_model.dart';
import 'package:weather_app/viewModel/weather_view_model.dart';


class HomePresenter {
  static final HomePresenter _mInstance = HomePresenter._();
  static HomePresenter get instance => _mInstance;

  late LocationViewModel _locationViewModel;
  late WeatherViewModel _weatherViewModel;

  HomePresenter._() {
    _locationViewModel = Get.find();
    _weatherViewModel = Get.find();
  }

  Future getCurrentLocation(BuildContext context) async {
    context.loaderOverlay.show();
    try {
      await _locationViewModel.getCurrentLocation();
      double lat = _locationViewModel.lat!, lng = _locationViewModel.lng!;
      await _weatherViewModel.getWeatherByLatLng(lat,lng);
    } on AppException catch (e) {
      Get.snackbar(e.prefix, e.message);
    }
    on Exception {
      Get.snackbar('Error', 'Something went wrong');
    }
    finally{
      context.loaderOverlay.hide();
    }
  }

  openLanguagePage(BuildContext context) {}

}
