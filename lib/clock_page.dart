import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'clock_view.dart';

class ClockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var now=DateTime.now();
    var formattedTime= DateFormat('HH:mm').format(now);
    var formattedDate= DateFormat('EEE, d MMM').format(now);
    var timezoneString= now.timeZoneOffset.toString().split('.').first;
    var offsetSign='';
    if(!timezoneString.startsWith('-')) offsetSign='+';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 1,fit: FlexFit.tight,
              child: Text('Clock',style: TextStyle(  fontFamily: 'avenir',color:Colors.white,fontSize: 24,fontWeight: FontWeight.w500),)),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(formattedTime,style: TextStyle(  fontFamily: 'avenir',color:Colors.white,fontSize: 60),),
                Text(formattedDate,style: TextStyle(  fontFamily: 'avenir',color:Colors.white,fontSize: 20),),
              ],
            ),
          ),
          Flexible(
              flex: 4,
//                      fit: FlexFit.tight,
              child: Align(
                alignment: Alignment.center,
                child:
                ClockView(size: MediaQuery.of(context).size.width*0.5,),
              )),
          Flexible(
            flex: 2,fit: FlexFit.tight,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Timezone',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        color: Colors.white, fontSize: 24),),
                  SizedBox(height: 16,),
                  Row(children: [
                    Icon(Icons.language, color: Colors.white,),
                    SizedBox(width: 16,),
                    Text("UTC" + offsetSign + timezoneString,
                      style: TextStyle(
                          fontFamily: 'avenir',
                          color: Colors.white, fontSize: 14),)
                  ],
                  )
                ]
            ),
          ),
        ],
      ),
    );
  }
}
