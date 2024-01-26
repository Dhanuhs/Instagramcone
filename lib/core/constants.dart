import 'dart:math';

String getTimeAgo(int timestamp) {
  DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(timestamp);
  DateTime now = DateTime.now();

  int differenceInSeconds = max(0, now.difference(dateTime).inSeconds);
  if (differenceInSeconds < 60) {
    return "$differenceInSeconds seconds ago";
  } else {
    int differenceInMinutes = differenceInSeconds ~/ 60;

    if (differenceInMinutes < 60) {
      return "$differenceInSeconds minutes ago";
    } else {
      int differenceInHours = differenceInMinutes ~/ 60;

      if (differenceInHours < 60) {
        return "$differenceInHours Hours ago";
      } else {
        int differenceInDays = differenceInMinutes ~/ 60;
        return "$differenceInDays Days ago";
      }
    }
  }
}
