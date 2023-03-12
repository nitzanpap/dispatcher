import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  final DateFormat formatter = DateFormat('EEEE MMM dd, yyyy');
  final String formattedDate = formatter.format(dateTime);
  return formattedDate;
}

bool isDateTimeLessThanAnHourAgo(DateTime? last) {
  if (last == null) {
    return false;
  }
  DateTime now = DateTime.now();
  Duration difference = now.difference(last);
  return difference.inHours <= 1;
}
