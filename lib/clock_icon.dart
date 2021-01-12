import 'dart:math';
import 'package:flutter/material.dart';

class ClockIcon extends StatelessWidget {
  final double size;
  ClockIcon({this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
//      color:Colors.pink,
      width: size,height: size,
      child: Transform.rotate(
        angle: -pi/2,
        child: CustomPaint(
          painter: ClockIconPainter(),
        ),
      ),
    );
  }
}

class ClockIconPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
     var centerX=size.width/2;
     var centerY=size.height/2;
     var center=Offset(centerX,centerY);
     var radius=min(centerX,centerY);
     var fillBrush=Paint()..color=Color(0xFF444974);
     canvas.drawCircle(center, radius*0.80, fillBrush);



     var minHandBrush = Paint()..color=Color(0xFF77DDFF)
       ..style = PaintingStyle.stroke
       ..strokeCap = StrokeCap.round
       ..strokeWidth = 8;
     canvas.drawLine(center, Offset(size.height*0.65,size.width*0.56), minHandBrush);

     var hourHandBrush = Paint()..color=Color(0xFFEA74AB)
       ..style = PaintingStyle.stroke
       ..strokeCap = StrokeCap.round
       ..strokeWidth = 7;
     canvas.drawLine(center, Offset(size.height*0.85,size.width*0.43), hourHandBrush);

     var centerFillBrush=Paint()..color=Colors.white;
     canvas.drawCircle(center, radius*0.05, centerFillBrush);




     var outerRadius=radius*0.8;
     var innerRadius=radius*0.70;
     var dashBrush=Paint()..color=Colors.grey.shade600..style=PaintingStyle.stroke..strokeWidth=5;
     for(int i=0;i<360;i+=30){
       var x1= centerX + outerRadius*cos(i*pi/180);
       var y1= centerY + outerRadius*sin(i*pi/180);

       var x2= centerX + innerRadius*cos(i*pi/180);
       var y2= centerY + innerRadius*sin(i*pi/180);
       canvas.drawLine(Offset(x2,y2),Offset(x1,y1),dashBrush);
     }

     var outLineBrush=Paint()..color=Colors.grey.shade600..style=PaintingStyle.stroke..strokeWidth=8;
     canvas.drawCircle(center, radius*0.80, outLineBrush);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
