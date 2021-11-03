import 'package:intl/intl.dart';

getReadableDate(int utcTimeStamp){
  var format = DateFormat.yMd();
  DateTime dateTime = getDateTime(utcTimeStamp);
  return format.format(dateTime.toLocal());
}

getWeakDay(int utcTimeStamp){
  var format = DateFormat.EEEE();
  DateTime dateTime = getDateTime(utcTimeStamp);
  return format.format(dateTime.toLocal());
}

getHumanTime(int utcTimeStamp){
  var format = DateFormat.Hm();
  DateTime dateTime = getDateTime(utcTimeStamp);
  return format.format(dateTime.toLocal());
}

getDateTime(int utcTimeStamp){
  return DateTime.fromMillisecondsSinceEpoch(utcTimeStamp * 1000, isUtc: true);
}