import 'package:intl/intl.dart';

getReadableDate(int utcTimeStamp){
  var format = DateFormat.yMd();
  DateTime dateTime = getDateTime(utcTimeStamp);
  return format.format(dateTime.toLocal());
}

String getWeakDay(int utcTimeStamp){
  var format = DateFormat.EEEE();
  DateTime dateTime = getDateTime(utcTimeStamp);
  return format.format(dateTime.toLocal());
}

getReadableTime(int utcTimeStamp){
  var format = DateFormat.Hm();
  DateTime dateTime = getDateTime(utcTimeStamp);
  return format.format(dateTime.toLocal());
}

DateTime getDateTime(int utcTimeStamp){
  return DateTime.fromMillisecondsSinceEpoch(utcTimeStamp * 1000, isUtc: true);
}

bool isToday(int utcTimeStamp){
  DateTime date = getDateTime(utcTimeStamp).toLocal();
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day).difference(DateTime(now.year, now.month, now.day)).inDays == 0;
}

bool isAfterToday(int utcTimeStamp, int numberOfDays){
  DateTime date = getDateTime(utcTimeStamp).toLocal();
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day).difference(DateTime(now.year, now.month, now.day + 1)).inDays == numberOfDays;
}
