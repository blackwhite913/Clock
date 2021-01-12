import 'package:expensetracker/constants.dart';
import 'package:expensetracker/enum.dart';

import 'alarm_info.dart';
import 'menu_info.dart';

List<MenuInfo> menuItems=[
  MenuInfo(MenuType.clock,title: 'Clock',image:'assets/clock_icon.png' ),
  MenuInfo(MenuType.alarm,title:'Alarm',image:'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,title: 'Timer',image:'assets/timer_icon.png' ),
  MenuInfo(MenuType.stopwatch,title:'Stopwatch',image:'assets/stopwatch_icon.png'),
];

List<AlarmInfo> alarms=[
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),description: 'Office',gradient: GradientColors.fire),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)),description: 'Sport',gradient: GradientColors.mango),
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),description: 'Office',gradient: GradientColors.sea),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)),description: 'Sport',gradient: GradientColors.sunset),
];