/**
 * 日期的实体类
 */
class DateModel {
  int year;
  int month;
  int day;

  int lunarYear;
  int lunarMonth;
  int lunarDay;

  String lunarString; //农历字符串
  String solarTerm; //24节气
  String gregorianFestival; //公历节日
  String traditionFestival; //传统农历节日

  bool isLeapYear; //是否是闰年
  bool isWeekend; //是否是周末
  int leapMonth;//如果是闰月，则返回闰月


}
