
import 'package:expensetracker/timer/timer_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'alarm_page.dart';
import 'clock_page.dart';
import 'data.dart';
import 'enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu_info.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//       home: ClockIcon(),
        home: ChangeNotifierProvider<MenuInfo>(
          create:(context)=>MenuInfo(MenuType.clock),
          child: HomePage(),
         ),
      );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon',);
    var initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String title, String body, String payload) async {});
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
           if(payload!=null){
             debugPrint(payload);
           }
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems.map((menuItem) =>buildMenuButton(menuItem)).toList(),
          ),
          VerticalDivider(color: Colors.white,thickness: 0.25,),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget child) {
                if (value.menuType == MenuType.clock)
                  return ClockPage();
                else if (value.menuType == MenuType.alarm)
                  return AlarmPage();
                else if (value.menuType == MenuType.timer)
                  return TimerPage();
                else
                  return Container(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: 'Upcoming Tutorial\n'),
                          TextSpan(
                            text: value.title,
                            style: TextStyle(fontSize: 48),
                          ),
                        ],
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget buildMenuButton(currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget child){
        return FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
          color: currentMenuInfo.menuType== value.menuType?Colors.pink.shade900:Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          onPressed: () {
            var menuInfo= Provider.of<MenuInfo>(context,listen: false);
            menuInfo.updateMenuInfo(currentMenuInfo);
          },
          child: Column(
            children: [
              Image.asset(currentMenuInfo.image,scale: 1.5,),
              SizedBox(height: 16,),
              Text(currentMenuInfo.title ?? '',style: TextStyle(fontFamily:"avenir",color: Colors.white,fontSize: 14),)
            ],
          ),
        );
      }
    );
  }
}



