import 'package:intl/intl.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isNotSameDate(DateTime other) {
    return !isSameDate(other);
  }

  bool isToday() {
    return isSameDate(DateTime.now());
  }

  bool isDayBefore(DateTime other) {
    return year == other.year && month == other.month && day == (other.day - 1);
  }

  bool isDayAfter(DateTime other) {
    return year == other.year && month == other.month && day == (other.day + 1);
  }

  bool isNotToday() {
    return !isToday();
  }

  bool isThisYear() {
    return year == DateTime.now().year;
  }

  bool isNotThisYear() {
    return !isThisYear();
  }

  bool isInList(List<DateTime> list) {
    return list.any(isSameDate);
  }

  bool isNotInList(List<DateTime> list) {
    return !list.any(isSameDate);
  }

  bool isAfterOrEqual(DateTime other) {
    return isAfter(other) || isAtSameMomentAs(other);
  }

  bool isBeforeOrEqual(DateTime other) {
    return isBefore(other) || isAtSameMomentAs(other);
  }

  bool isBetween(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end);
  }

  bool isBetweenOrEqual(DateTime start, DateTime end) {
    return isAfterOrEqual(start) && isBeforeOrEqual(end);
  }
}

extension DateOf on DateTime {
  DateTime weekdayOf(int weekdayIndex) {
    return DateTime(
      year,
      month,
      day - weekday + weekdayIndex,
      hour,
      minute,
      second,
    );
  }

  DateTime firstDayOfWeek() {
    return weekdayOf(DateTime.monday);
  }

  DateTime lastDayOfWeek() {
    return weekdayOf(DateTime.sunday);
  }

  DateTime nextWeek() {
    return add(const Duration(days: 7));
  }

  DateTime previousWeek() {
    return subtract(const Duration(days: 7));
  }

  DateTime monthsAgo(int n) {
    return DateTime(year, month - n, day);
  }

  DateTime firstDayOfMonth() {
    return DateTime(year, month, 1);
  }

  DateTime startOfTheDay() {
    return DateTime(year, month, day);
  }

  DateTime endOfTheDay() {
    return DateTime(year, month, day, 23, 59, 59);
  }
}

extension DateLogic on DateTime {
  bool hasMonthTransitionInTheWeek() {
    final nextWeekDate = lastDayOfWeek();
    return month != nextWeekDate.month;
  }

  bool hasYearTransitionInTheWeek() {
    final nextWeekDate = lastDayOfWeek();
    return year != nextWeekDate.year;
  }
}

extension DateFormatter on DateTime {
  String format({String pattern = "yyyy-MM-dd'T'HH:mm:ss"}) {
    return DateFormat(pattern).format(this);
  }
}
