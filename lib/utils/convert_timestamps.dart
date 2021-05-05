import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateConverter {
  static String convertTimeStamp(Timestamp timestamp) {
    assert(timestamp != null);
    String convertedDate;
    // convertedDate = DateFormat.yMMMd().add_jm().format(timestamp.toDate());
    convertedDate = timeago.format(timestamp.toDate());
    return convertedDate;
  }
}
