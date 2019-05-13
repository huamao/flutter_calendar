import 'dart:math';

/**
 * 工具类
 */
class DateUtil {
  /**
   * 判断一个日期是否是周末，即周六日
   */
  static bool isWeekend(DateTime dateTime) {
    return dateTime.weekday == DateTime.saturday ||
        dateTime.weekday == DateTime.sunday;
  }

  /**
   * 获取某月的天数
   *
   * @param year  年
   * @param month 月
   * @return 某月的天数
   */
  static int getMonthDaysCount(int year, int month) {
    int count = 0;
    //判断大月份
    if (month == 1 ||
        month == 3 ||
        month == 5 ||
        month == 7 ||
        month == 8 ||
        month == 10 ||
        month == 12) {
      count = 31;
    }

    //判断小月
    if (month == 4 || month == 6 || month == 9 || month == 11) {
      count = 30;
    }

    //判断平年与闰年
    if (month == 2) {
      if (isLeapYear(year)) {
        count = 29;
      } else {
        count = 28;
      }
    }
    return count;
  }

  /**
   * 是否是闰年
   */
  static bool isLeapYear(int year) {
    return ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
  }

  /**
   * 本月的第几周
   */
  static int getIndexWeekInMonth(DateTime dateTime) {
    DateTime firstdayInMonth = new DateTime(dateTime.year, dateTime.month, 1);
    Duration duration = dateTime.difference(firstdayInMonth);
    return (duration.inDays / 7).toInt() + 1;
  }

  /**
   * 本周的第几天
   */
  static int getIndexDayInWeek(DateTime dateTime) {
    DateTime firstdayInMonth = new DateTime(
      dateTime.year,
      dateTime.month,
    );
    Duration duration = dateTime.difference(firstdayInMonth);
    return (duration.inDays / 7).toInt() + 1;
  }

  /**
   * 本月第一天，是那一周的第几天,从1开始
   * @return 获取日期所在月视图对应的起始偏移量 the start diff with MonthView
   */
  static int getIndexOfFirstDayInMonth(DateTime dateTime) {
    DateTime firstDayOfMonth = new DateTime(dateTime.year, dateTime.month, 1);

    int week = firstDayOfMonth.weekday;

    return week;
  }

  static List<DateTime> initCalendarForMonthView(
      int year, int month, DateTime currentDate, int weekStart) {
    weekStart = DateTime.monday;
    //获取月视图其实偏移量
    int mPreDiff = getIndexOfFirstDayInMonth(new DateTime(year, month));
    //获取该月的天数
    int monthDayCount = getMonthDaysCount(year, month);

    print("$year年$month月,有$monthDayCount天,第一天的index为${mPreDiff}");

    List<DateTime> result = new List();

    int size = 42;

    DateTime firstDayOfMonth = new DateTime(year, month, 1);
    DateTime lastDayOfMonth = new DateTime(year, month, monthDayCount);

    for (int i = 0; i < size; i++) {
      if (i < mPreDiff - 1) {
        DateTime temp =
            firstDayOfMonth.subtract(Duration(days: mPreDiff - i - 1));

        result.add(temp);
        //这个上一月的几天
      } else if (i >= monthDayCount + (mPreDiff - 1)) {
        DateTime temp = lastDayOfMonth
            .add(Duration(days: i - mPreDiff - monthDayCount + 2));
        result.add(temp);
        //这是下一月的几天
      } else {
        //这个月的
        DateTime temp = new DateTime(year, month, i - mPreDiff + 2);
        result.add(temp);
      }
    }


//    for (int i = 0; i < size; i++) {
//      print("result[$i]:${result[i]}");
//    }

      return result;
  }

  /**
   * 月的行数
   */
  static int getMonthViewLineCount(int year, int month) {
    DateTime firstDayOfMonth = new DateTime(year, month, 1);
    int monthDayCount = getMonthDaysCount(year, month);
//    DateTime lastDayOfMonth = new DateTime(year, month, monthDayCount);

    int preIndex = firstDayOfMonth.weekday - 1;
//    int lastIndex = lastDayOfMonth.weekday;

    print("$year年$month月:有${((preIndex + monthDayCount) / 7).toInt() + 1}行");
    return ((preIndex + monthDayCount) / 7).toInt() + 1;
  }
}
