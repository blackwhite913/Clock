import 'package:expensetracker/timer/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetButton extends StatefulWidget {
  final double bevel;
  const ResetButton({
    this.bevel = 10.0,
    Key key,
  }) :super(key: key);

  @override
  _ResetButtonState createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TimerService>(
      builder: (BuildContext context,data,child){
        return FlatButton(
          minWidth: 300,
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(15),
          ),
            onPressed: (){
              data.updateTimer();
              if(data.isSet==false){
                data.reset();
              }
            },
            child:Stack(
              children: [
                Container(
                  width: 400,
                  height: 86,
                  decoration: BoxDecoration(
                    color:Color(0xff00b8ba),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Positioned(
                  top: 6,left: 6,right: 6,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    height: 73,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      child: Center(
                        child: Icon(Icons.repeat,color: Colors.pink.shade700,size: 50,),
                      ),
                    ),
                  ),
                ),
              ],
            )
        );
      },
    );
  }
}


