import 'dart:ui';

class AlarmInfo{
  DateTime alarmDateTime;
  String description;
  bool isActive;
  List<Color> gradient;

  AlarmInfo(this.alarmDateTime,{this.isActive,this.description,this.gradient});
}