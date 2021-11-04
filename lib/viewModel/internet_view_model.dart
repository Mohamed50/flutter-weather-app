import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:weather_app/config/app_exception.dart';

enum ConnectivityType { mobileData, wifi, disconnected, noInternet, connecting }

class InternetViewModel extends GetxController {
  Rx<ConnectivityType> connectionType = ConnectivityType.connecting.obs;

  late final Connectivity _connectivity;
  late StreamSubscription _streamSubscription;

  InternetViewModel() {
    _connectivity = Connectivity();
  }

  _listenToConnectivity() {
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future getConnectivity() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    await _updateState(connectivityResult);
  }

  isConnected() {
    return connectionType.value == ConnectivityType.wifi ||
        connectionType.value == ConnectivityType.mobileData ||
        connectionType.value == ConnectivityType.connecting;
  }

  _updateState(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = ConnectivityType.wifi;
        await _checkInternetConnection();
        break;
      case ConnectivityResult.mobile:
        connectionType.value = ConnectivityType.mobileData;
        await _checkInternetConnection();
        break;
      case ConnectivityResult.none:
        connectionType.value = ConnectivityType.disconnected;
        throw NetworkException('No internet connection');
      default:
        connectionType.value = ConnectivityType.disconnected;
        throw NetworkException('Failed to get Network Status');
    }
  }

  _checkInternetConnection() async {
    final result = await InternetAddress.lookup('google.com');
    if (result.isEmpty) {
      connectionType.value = ConnectivityType.noInternet;
      throw NetworkException('Failed to get Network Status');
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}
