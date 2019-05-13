import 'package:flutter/material.dart';
import 'package:flutter_calendar/month_view.dart';
import 'package:flutter_calendar/month_view_pager.dart';
import 'package:flutter_calendar/week_bar.dart';
import 'package:flutter_calendar/week_view.dart';

/**
 * 暂时默认是周一开始的
 */
class CalendarViewWidget extends StatefulWidget {
  @override
  _CalendarViewWidgetState createState() => _CalendarViewWidgetState();
}

class _CalendarViewWidgetState extends State<CalendarViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //设置充满宽度
      constraints:
          BoxConstraints.expand(width: MediaQuery.of(context).size.width),
      child: new Column(
        children: <Widget>[
          WeekBar(),
//          MonthView(
//            year: 2019,
//            month: 5,
//          )
          Expanded(child: MonthViewPager())
        ],
      ),
    );
  }
}
