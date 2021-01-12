import 'dart:async';
import 'package:expensetracker/timer/analog_timer_Scrollable.dart';
import 'package:expensetracker/timer/play_Circle.dart';
import 'analog_timer.dart';
import 'cool_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timeService = TimerService();
    return ChangeNotifierProvider<TimerService>(
      create: (_) => timeService,
      child: Material(
        color: Color(0xFF2D2F41),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Timer', style: TextStyle(fontFamily: 'avenir',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),),
              SizedBox(height: 60,),
              Consumer<TimerService>(
                  builder: (BuildContext context,data,child){
                     return data.isSet?NeuDigitalClock():TimePick();
                  }
                  ),
              SizedBox(height: 80,),
              Consumer<TimerService>(
                  builder: (BuildContext context,data,child){
                    return data.isSet?CircleMagic():Container();
                  }
              ),
              Consumer<TimerService>(
                  builder: (BuildContext context,data,child){
                    return data.isSet?SizedBox(height: 160,):SizedBox(height: 140,);
                  }
              ),
              ResetButton(),
            ],
          ),
        ),),
    );
  }
}



class TimerService extends ChangeNotifier {
  Timer _timer;
  int timeConverter;
  bool _isSet=false;
  bool get isSet =>_isSet;
  int hour=0;int min=0;int sec=0;
  bool get isRunning => _timer != null;

  void updateTimer(){
    _isSet=!_isSet;
    notifyListeners();
  }

  void _onTick(Timer timer) {
    if(hour!=0||min!=0||sec!=0) {
      timeConverter = timeConverter - 1;
      hour = timeConverter ~/ 3600;
      sec = timeConverter % 3600;
      min = sec ~/ 60;
      sec = sec % 60;

      notifyListeners();
    }
  }

  void hours(int value){
    hour=value;
    notifyListeners();
  }
  void secs(int value){
    sec=value;
    notifyListeners();
  }
  void mins(int value){
    min=value;
    notifyListeners();
  }

  void start() {
    if (_timer != null) return; /// USE FULL CAUSE IT AVOIDS CREATING MANY INSTANCE OF A TIMER///
      timeConverter= ((hour*60*60)+(min*60)+sec);
      _timer = Timer.periodic(Duration(seconds: 1), _onTick);
      notifyListeners();
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    notifyListeners();
  }

  void reset() {
    stop();
   hour=min=sec=0;
    notifyListeners();
  }
// source: https://stackoverflow.com/questions/53228993/how-to-implement-persistent-stopwatch-in-flutter
}
