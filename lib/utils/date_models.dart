import 'package:paged_vertical_calendar/utils/date_utils.dart';

class Month {
  final int month;
  final int year;
  final int daysInMonth;
  final List<Week> weeks;

  Month(this.weeks)
      : year = weeks.first.firstDay.year,
        month = weeks.first.firstDay.month,
        daysInMonth = weeks.first.firstDay.daysInMonth;

  @override
  String toString() {
    return 'Month{month: $month, year: $year, daysInMonth: $daysInMonth, weeks: $weeks}';
  }
}

class Week {
  final DateTime firstDay;
  final DateTime lastDay;

  Week(this.firstDay, this.lastDay);

  int get duration => lastDay.day - firstDay.day;

  bool get isLastWeekOfMonth => lastDay.day == lastDay.daysInMonth;

  @override
  String toString() {
    return 'Week{firstDay: $firstDay, lastDay: $lastDay}';
  }
}

enum WeekDay { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

extension WeekDayX on WeekDay {
  // In Dart monday is 1 and sunday is 7 so to get correct value by enum we can
  // add one to make it relevant
  int get valueEquivalentToDartImplementation => index + 1;
}

WeekDay getWeekDayByDartDayValue(int dayValue) {
  if (dayValue > 7 || dayValue < 1) {
    throw WeekDayOutOfRangeException('$dayValue is not within range of 1 - 7');
  }
  return WeekDay.values[dayValue - 1];
}

class WeekDayOutOfRangeException implements Exception {
  final String message;

  WeekDayOutOfRangeException(this.message);
}
