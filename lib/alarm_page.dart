import 'package:dotted_border/dotted_border.dart';
import 'package:expensetracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'data.dart';
import 'main.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  bool isSwitched=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Alarm', style: TextStyle(fontFamily: 'avenir',
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500),),
          Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: alarms.map<Widget>((alarm){
                  return Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors:alarm.gradient,
                          begin: Alignment.centerLeft,end: Alignment.centerRight
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: alarm.gradient.last.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: -2,
                          offset: Offset(4,4),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.label,color: Colors.white,size: 24,
                                ),
                                SizedBox(width: 8,),
                                Text(alarm.description,style: TextStyle(color: Colors.white,fontFamily: 'avenir'),)
                              ],
                            ),
                            Switch(
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched=value;
                                });
                              }, value: isSwitched,
                            ),
                          ],
                        ),
                        Text("Mon-Fri", style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(DateFormat('jm').format(alarm.alarmDateTime), style: TextStyle(
                                fontSize: 24,
                                color: Colors.white, fontFamily: 'avenir',fontWeight: FontWeight.w700),),
                            Icon(
                                Icons.keyboard_arrow_down,
                                size: 36, color: Colors.white
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }).followedBy([
                  DottedBorder(
                    strokeWidth: 3,
                    color: CustomColors.clockOutline,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(20),
                    child: Container(
                      width: double.infinity,
                      decoration:BoxDecoration(
                        color: CustomColors.clockBG,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                        onPressed: (){
                          scheduleAlarm();
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/add_alarm.png',scale: 1.5,),
                            SizedBox(height: 8,),
                            Text("Add Alarm", style: TextStyle(
                                color: Colors.white, fontFamily: 'avenir'),),
                          ],
                        ),
                      ),
                    ),
                  )
                ]).toList(),
              )
          )
        ],
      ),
    );
  }
  void scheduleAlarm() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      color: Colors.amber,
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      importance: Importance.Max,);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(
        1,
        'Office',
        'Good morning! Time for office.',
        DateTime.now().add(Duration(seconds: 1)),
        platformChannelSpecifics);
  }
}
