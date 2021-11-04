import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/src/overlay_controller_widget_extension.dart';
import 'package:weather_app/config/app_exception.dart';
import 'package:weather_app/config/keys.dart';
import 'package:weather_app/data/models/language.dart';
import 'package:weather_app/data/services/localization_service.dart';
import 'package:weather_app/utils/assets_utils.dart';
import 'package:weather_app/view/home.dart';
import 'package:weather_app/view/languages.dart';
import 'package:weather_app/viewModel/internet_view_model.dart';
import 'package:weather_app/viewModel/location_view_model.dart';
import 'package:weather_app/viewModel/weather_view_model.dart';

class HomePresenter {
  static final HomePresenter _mInstance = HomePresenter._();

  static HomePresenter get instance => _mInstance;

  late LocationViewModel _locationViewModel;
  late WeatherViewModel _weatherViewModel;
  late InternetViewModel _internetViewModel;

  HomePresenter._() {
    _locationViewModel = Get.find();
    _weatherViewModel = Get.find();
    _internetViewModel = Get.find();
  }

  Future getCurrentLocation(BuildContext context) async {
    context.loaderOverlay.show();
    try {
      await _locationViewModel.getCurrentLocation();
      double lat = _locationViewModel.lat!, lng = _locationViewModel.lng!;
      await _weatherViewModel.getWeatherByLatLng(lat, lng);
    } on AppException catch (e) {
      Get.snackbar(e.prefix, e.message);
    } on Exception {
      Get.snackbar(errorTitle.tr, somethingWentWrongMessage.tr);
    } finally {
      context.loaderOverlay.hide();
    }
  }

  Future<void> openLanguagePage(BuildContext context) async {
    context.loaderOverlay.show();
    try {
      List json = await getJsonFromAssetsFile('languages');
      List<LanguageModel> languages = languageModelFromJson(json);
      Get.to(() => LanguagesPage(languages: languages));
    }
    catch(e){
      Get.snackbar(fetchingErrorTitle.tr, languageErrorMessage.tr);
    }
    finally {
      context.loaderOverlay.hide();
    }
  }

  Future<void> checkConnectivity() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      await _internetViewModel.getConnectivity();
      _locationViewModel.init();
      Get.off(() => const HomePage());
    } on NetworkException catch (e) {
      Get.snackbar(e.prefix.tr, e.message.tr);
    } on Exception {
      Get.snackbar(fetchingErrorTitle.tr, languageErrorMessage.tr);
    }
  }

  initSplash() async {
    await Future.delayed(const Duration(seconds: 1));
    LocalizationService.init();
    _locationViewModel.checkLocationData();
    checkConnectivity();
  }

}
