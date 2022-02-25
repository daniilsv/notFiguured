extension DateExtension on DateTime {
  bool inSameDay(DateTime anotherDate) {
    final t = this;
    return t.difference(anotherDate).inDays == 0;
  }

  static DateTime fromUnixSeconds(int seconds) {
    return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  }

  DateTime get onlyDate => DateTime(year, month, day);
}

extension TimestampExtension on double {
  double get todayTimeStamp =>
      DateTime.fromMillisecondsSinceEpoch(this.floor() * 1000)
          .onlyDate
          .millisecondsSinceEpoch /
      1000;
}
