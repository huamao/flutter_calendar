import 'package:flutter/material.dart';
import 'package:flutter_calendar/model/date_model.dart';
import 'package:flutter_calendar/month_view.dart';

class MonthViewPager extends StatefulWidget {
  @override
  _MonthViewPagerState createState() => _MonthViewPagerState();
}

class _MonthViewPagerState extends State<MonthViewPager> {
  PageController pageController;

  //最小年份和最大年份
  int minYear = 1971;
  int maxYear = 2055;

  //最小年份的月份，最大年份的月份
  int minYearMonth = 1;
  int maxYearMonth = 12;

  //当前的年份和月份
  int nowYear = DateTime.now().year;
  int nowMonth = DateTime.now().month;

  int initialPage=0;

  List<DateModel> list = new List();

  @override
  void initState() {
    int nowMonthIndex=0;
    for (int i = minYear; i <= maxYear; i++) {
      for (int j = 1; j <= 12; j++) {
        if (i == minYear && j < minYearMonth) {
          continue;
        }
        if (i == maxYear && j > maxYearMonth) {
          continue;
        }
        DateModel dateModel = new DateModel();
        dateModel.year = i;
        dateModel.month = j;

        if(i==nowYear&&j==nowMonth){
          initialPage=nowMonthIndex;
        }
        list.add(dateModel);
        nowMonthIndex++;
      }
    }

    pageController = new PageController(initialPage: initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        DateModel dateModel = list[index];
        return new MonthView(year: dateModel.year, month: dateModel.month);
      },
      itemCount: list.length,
    );
  }
}
