import 'package:flutter/material.dart';
import 'package:flutter_calendar/model/date_model.dart';
import 'package:flutter_calendar/utils/date_util.dart';
import 'package:flutter_calendar/utils/lunar_util.dart';

/**
 * 月视图，显示整个月的日子
 */
class MonthView extends StatefulWidget {
  int year;
  int month;
  int day;

  MonthView({@required this.year, @required this.month, this.day});

  @override
  _MonthViewState createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
  List<DateTime> items;

  int lineCount;

  double itemHeight;
  double totalHeight;
  double mainSpacing = 10;

  double childAspectRatio = 1;

  //当前月份的文字
  TextStyle currentMonthTextStyle =
      new TextStyle(color: Colors.black, fontSize: 18);

  //下一个月或者上一个月的文字
  TextStyle preOrNextMonthTextStyle =
      new TextStyle(color: Colors.grey, fontSize: 18);

  //农历的字体
  TextStyle lunarTextStyle = new TextStyle(color: Colors.grey, fontSize: 14);

  int year;
  int month;

  @override
  void initState() {
    super.initState();

    year = widget.year;
    month = widget.month;

    items = DateUtil.initCalendarForMonthView(
        year, month, DateTime.now(), DateTime.sunday);

    lineCount = DateUtil.getMonthViewLineCount(year, month);
  }

  @override
  Widget build(BuildContext context) {
    itemHeight = MediaQuery.of(context).size.width / 7 * childAspectRatio;
    totalHeight = itemHeight * lineCount + mainSpacing * lineCount;

    return Container(height: totalHeight, child: getView());
  }

  Widget getView() {
    return new GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: childAspectRatio,
            mainAxisSpacing: 10),
        itemCount: 7*lineCount,
        itemBuilder: (context, index) {
          DateTime dateTime = items[index];

          DateModel dateModel = new DateModel();
          dateModel.year = dateTime.year;
          dateModel.month = dateTime.month;
          dateModel.day = dateTime.day;

          LunarUtil.setupLunarCalendar(dateModel);

          return Container(
//              decoration:
//                  new BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              //公历
              new Positioned(
                child: new Text(
                  dateTime.day.toString(),
                  style: currentMonthTextStyle,
                ),
                top: 10,
              ),

              //农历
              new Positioned(
                child: new Text(
                  "${dateModel.lunarString}",
                  style: lunarTextStyle,
                ),
                bottom: 10,
              ),
            ],
          ));
        });
  }
}
