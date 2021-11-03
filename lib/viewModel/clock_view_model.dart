import 'package:get/get.dart';

class ClockViewModel extends GetxController{
  final Rx<DateTime> _currentTime = DateTime.now().obs;
  DateTime get currentTime => _currentTime.value;

  ClockViewModel(){
    init();
  }

  void init(){
    getTime().listen((dateTime) {
      _currentTime.value = dateTime;
    });
  }

  Stream<DateTime> getTime() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield DateTime.now();
    }
  }


}