import 'package:get/get.dart';

class DayViewModel extends GetxController {

  RxInt _selectedDayIndex = 0.obs;
  int get selectedDayIndex =>  _selectedDayIndex.value;


  onTabViewChanged(int index){
    _selectedDayIndex.value = index;
  }


}
