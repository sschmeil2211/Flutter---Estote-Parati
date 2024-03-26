import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String getDate(Timestamp date) => DateFormat('dd/MM/yyyy', 'es').format(date.toDate());

String getDayAndMonthLargeFormat(Timestamp date) => DateFormat('MMMM dd', 'es').format(date.toDate());

String getDayAndMonthShortFormat(Timestamp date) => DateFormat('dd/MM', 'es').format(date.toDate());

String getYear(Timestamp date) => DateFormat('yyyy', 'es').format(date.toDate());

String getHour(Timestamp date) {
  DateTime dateTime = date.toDate();
  String hour = (dateTime.hour).toString().padLeft(2, '0');
  String minutes = dateTime.minute.toString().padLeft(2, '0');
  return '$hour:$minutes';
}