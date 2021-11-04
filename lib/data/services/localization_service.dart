import 'dart:ui';
import 'package:get/get.dart';
import 'package:weather_app/config/lang/ar.dart';
import 'package:weather_app/config/lang/en.dart';
import 'package:weather_app/data/services/memory_service.dart';

class LocalizationService extends Translations {
  static const fallbackLocale = Locale('en');
  static Locale? _locale = Get.deviceLocale;

  static Locale get locale {
    return _locale ?? fallbackLocale;
  }

  static init() {
    MemoryService _memoryService = Get.find();
    String? languageCode = _memoryService.languageCode;
    if (languageCode != null) {
      updateLocale(languageCode);
    }
  }

  static saveLocale(String languageCode) {
    MemoryService _memoryService = Get.find();
    _memoryService.languageCode = languageCode;
  }

  static updateLocale(String languageCode) {
    _locale = Locale(languageCode);
    Get.updateLocale(_locale!);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
