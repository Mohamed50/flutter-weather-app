import 'dart:ui';
import 'package:get/get.dart';
import 'package:weather_app/config/lang/ar.dart';
import 'package:weather_app/config/lang/en.dart';

class LocalizationService extends Translations {

  static const fallbackLocale = Locale('en');

  static Locale get locale {
    return Get.deviceLocale ?? fallbackLocale;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };

}
