import 'package:expensetracker/timer/play_button.dart';
import 'package:flutter/material.dart';

class CircleMagic extends StatefulWidget {
  const CircleMagic({
    Key key,
  }) : super(key: key);

  @override
  _CircleMagicState createState() => _CircleMagicState();
}

class _CircleMagicState extends State<CircleMagic> {
  bool _isPressed = false;

  void _onPointerDown() {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown:(_){
        _onPointerDown();
      },
      onPointerUp: _onPointerUp,
      child:  Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          height: 180,width: 180,
          decoration: BoxDecoration(
            color:  Color(0xff00ffed),
            shape: BoxShape.circle,
          ),
          child:  NeuPlay(isPressed: _isPressed,),
        ),
      ),);
  }
}




