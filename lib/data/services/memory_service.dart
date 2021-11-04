import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MemoryService extends GetConnect {

  late GetStorage _storage;

  MemoryService() {
    _storage = GetStorage();
  }

  double? get lat => _storage.read("lat");
  double? get lng => _storage.read("lng");
  String? get city => _storage.read("city");
  String? get languageCode => _storage.read("languageCode");

  set lat (double? lat) => _storage.write("lat", lat);
  set lng (double? lng) => _storage.write("lng", lng);
  set city (String? city) => _storage.write("city", city);
  set languageCode (String? languageCode) => _storage.write("languageCode", languageCode);

  bool hasLocationData() {
    return lat != null && lng != null;
  }


}
