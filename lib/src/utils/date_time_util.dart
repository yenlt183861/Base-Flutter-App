import 'package:intl/intl.dart';

class DateTimeUtil {
  /// defaul format [DateTimePattern.datetimeFormat]
  static String formatDateTimeToString(
      {required DateTime datetime, String? pattern, String? locale}) {
    return DateFormat(pattern ?? DateTimePattern.datetimeFormat, locale).format(datetime);
  }

  /// defaul format [DateTimePattern.datetimeFormat]
  static DateTime parseStringToDateTime(
      {required String timeStr, String? pattern, String? locale}) {
    return DateFormat(pattern ?? DateTimePattern.datetimeFormat, locale).parse(timeStr);
  }
}

class DateTimePattern {
  /// yyyy-MM-dd HH:mm:ss
  static const datetimeFormat = 'yyyy-MM-dd HH:mm:ss';

  /// HH:mm:ss
  static const dateFormat = 'HH:mm:ss';

  /// HH:mm:ss
  static const timeFormat = 'HH:mm:ss';
}

extension DateTimeEx on DateTime {
  DateTime get date => DateTime(year, month, day);

  bool isSame(DateTime date) => year == date.year && month == date.month && day == date.day;
}
