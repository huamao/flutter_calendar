import 'package:flutter/material.dart';
import 'package:random_pk/random_pk.dart';

List<String> weekList = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"];

/**
 * 顶部的固定的周显示
 */
class WeekBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        children: getWeekDayWidget(),
      ),
    );
  }
}

List<Widget> getWeekDayWidget() {
  return List.generate(7, (index) {
    return getChild(index);
  });
}

Widget getChild(int index) {
  return new Expanded(
      child: new Container(
    color: RandomColor.next(),
    height: 40,
    alignment: Alignment.center,
    child: new Text(weekList[index]),
  ));
}
