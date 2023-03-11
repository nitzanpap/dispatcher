import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  final DateFormat formatter = DateFormat('EEEE MMM dd, yyyy');
  final String formattedDate = formatter.format(dateTime);
  return formattedDate;
}
