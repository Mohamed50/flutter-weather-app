import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:weather_app/config/app_exception.dart';
import 'package:weather_app/data/services/memory_service.dart';
import 'package:weather_app/viewModel/weather_view_model.dart';

class LocationViewModel extends GetxController{
  late final MemoryService _memoryService;
  late final Location _location;

  double? _lat;
  double? get lat => _lat;

  double? _lng;
  double? get lng => _lng;

  String? _city;
  String? get city => _city;

  LocationViewModel() {
    _memoryService = Get.put(MemoryService());
    _location = Location();
    init();
  }

  void init() {
    _fetchDataFromMemory();
    if (lat != null && lng != null) {
      Get.find<WeatherViewModel>().getWeatherByLatLng(lat!, lng!);
    }
  }

  void _fetchDataFromMemory() {
    _lat = _memoryService.lat;
    _lng = _memoryService.lng;
    _city = _memoryService.city;
  }

  Future<bool> _checkService() async {
    bool _isServiceEnabled = await _location.serviceEnabled();
    if (!_isServiceEnabled || await _location.requestService()) {
      return true;
    }
    throw LocationException("please enable location service and try again");
  }

  Future<bool> _checkPermission() async {
    PermissionStatus _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.granted || await _location.requestPermission() == PermissionStatus.granted) {
        return true;
    }
    throw LocationException("please enable location permission and try again");
  }

  Future getCurrentLocation() async {
    if (await _checkService() && await _checkPermission()) {
      try {
        LocationData _locationData = await _location.getLocation();
        _setLocationData(_locationData);
      } catch (e) {
        throw LocationException("Error getting current location try again");
      }
    }
  }

  void _setLocationData(LocationData locationData){
    _lat = locationData.latitude;
    _lng = locationData.longitude;
    _memoryService.lat = locationData.latitude!;
    _memoryService.lng = locationData.longitude!;
  }

  void setCityName(String city){
    _city = city;
    update();
  }

}
