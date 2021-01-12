import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'timer_page.dart';


class NeuPlay extends StatefulWidget {
final bool isPressed;
  const NeuPlay({
    this.isPressed,
    Key key,
  }) : super(key: key);

  @override
  _NeuPlayState createState() => _NeuPlayState();
}

class _NeuPlayState extends State<NeuPlay> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  bool isActive=false;
  @override
  void initState() {
   _animationController=AnimationController(
     vsync:this, duration: Duration(milliseconds: 200),
   );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<TimerService>(
      builder: (BuildContext context ,data,child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: widget.isPressed
                ? [ BoxShadow(
              blurRadius: 10,
              spreadRadius: -8,
              offset: -Offset(5, 5),
              color: Colors.pink.shade900,
            ),
              BoxShadow(
                spreadRadius: -13,
                blurRadius: 10,
                offset: Offset(10.5, 10.5),
                color: Colors.pink.shade900,
              )

            ]
                : [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: -5,
                offset: -Offset(5, 5),
                color: Color(0xff00b8ba),
              ),
              BoxShadow(
                spreadRadius: -8,
                blurRadius: 10,
                offset: Offset(10.5, 10.5),
                color: Color(0xff00b8ba),
              )
            ],
          ),
          child:IconButton(
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    progress: _animationController ,
                      color: isActive==true ? Colors.pink.shade700 : Color(0xff00b8ba),
                    size: 70,
                  ),
                onPressed: (){
                    setState(() {
                      isActive=!isActive;
                      isActive ? _animationController.forward():_animationController.reverse();
                    });
                  bool _isRunning= data.isRunning;
                  _isRunning ? data.stop(): data.start();
                },
              )
        );
      }
    );
  }
}

