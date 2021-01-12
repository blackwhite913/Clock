import 'package:expensetracker/timer/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

import 'digital_font/digital_colan.dart';

class TimePick extends StatefulWidget {
  @override
  _TimePickState createState() => _TimePickState();
}

class _TimePickState extends State<TimePick> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xFF242634),
        borderRadius: BorderRadius.circular(15),
      ),
// Digital green background
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            padding: const EdgeInsets.only(left: 8),
            height: constraints.maxHeight * 0.87,
            width: constraints.maxWidth * 0.95,
            decoration: BoxDecoration(
//              color: GradientColors.fire.first,
              gradient: LinearGradient(
                  colors: [
                    Color(0xff00ffed),
                    Color(0xff00b8ba),
                  ]
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
            ),
            child: Consumer<TimerService>(
              builder: (BuildContext context,data,child){
                return Container(
                  height: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Expanded(child:
                        Stack(
                          children: [
                            NumberPicker.integer(
                                listViewWidth: 60,
                                textStyle: TextStyle(fontSize: 30,color:   Color(0xff00ffed).withOpacity(0.3),),
                                zeroPad: true,
                                selectedTextStyle:TextStyle(fontSize: 30,color: Colors.white) ,
                                initialValue: data.hour, minValue: 0, maxValue: 24, onChanged:(val){  Provider.of<TimerService>(context,listen: false).hours(val);}),
                            Positioned(left:3,bottom:120,child: Text('HOUR',style:TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold) ,)),

                          ],
                        ),),
                      ),
                      Container(margin:const EdgeInsets.only(top:50),child: DigitalColon(height: 50, color: Colors.white)),
                      Container(
                        child: Expanded(child:
                        Stack(
                          children: [
                            NumberPicker.integer(
                                listViewWidth: 60,
                                textStyle: TextStyle(fontSize: 30,color:  Color(0xff00b8ba).withOpacity(0.1),),
                                zeroPad: true,
                                selectedTextStyle:TextStyle(fontSize: 30,color: Colors.white) ,
                                initialValue: data.min, minValue: 0, maxValue: 59, onChanged:(val){  Provider.of<TimerService>(context,listen: false).mins(val);}),
                            Positioned(left:8,bottom:120,child: Text('MIN',style:TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold) ,)),

                          ],
                        ),),
                      ),
                      Container(margin:const EdgeInsets.only(top:50),child: DigitalColon(height: 50, color: Colors.white)),
                      Container(
                        child: Expanded(child:
                        Stack(
                          children: [
                            NumberPicker.integer(
                                listViewWidth: 60,
                                textStyle: TextStyle(fontSize: 30,color:  Color(0xff00b8ba).withOpacity(0.3),),
                                zeroPad: true,
                                selectedTextStyle:TextStyle(fontSize: 30,color: Colors.white) ,
                                initialValue: data.sec, minValue: 0, maxValue: 59, onChanged:(val){  Provider.of<TimerService>(context,listen: false).secs(val);}),
                            Positioned(left:8,bottom:120,child: Text('SEC',style:TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold) ,)),

                          ],
                        ),),
                      ),
                    ],
                  ),
                );
              },
            )
          ),
        ),
      ),
    );
  }
}

