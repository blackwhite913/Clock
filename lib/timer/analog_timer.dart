import 'package:expensetracker/timer/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'digital_font/digital_colan.dart';
import 'digital_font/digital_number.dart';




class NeuDigitalClock extends StatelessWidget {
  const NeuDigitalClock({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
        color: Color(0xFF242634),
        borderRadius: BorderRadius.circular(15),
//        boxShadow: [
//          BoxShadow(
//            blurRadius: 10,
//            spreadRadius: -10,
//            offset: -Offset(5, 5),
//            color: GradientColors.sea.first,
//          ),
//          BoxShadow(
//            spreadRadius: -12,
//            blurRadius: 10,
//            offset: Offset(10.5, 10.5),
//            color: GradientColors.sea.last,
//          )
//        ]
      ),
      // Digital green background
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
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
            child:Consumer<TimerService>(
              builder: (BuildContext context,data,child){
                return  DigitalClock(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  seconds: data.sec,
                  minutes: data.min,
                  hours: data.hour,
                );///I WIN///
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DigitalClock extends StatelessWidget {
  const DigitalClock({
    Key key,
    @required this.height,
    @required this.width,
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
  }) : super(key: key);

  final num height;
  final num width;
  final int hours;
  final int minutes;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    List<DigitalNumberWithBG> hourNumber = createNumberTime(hours);
    List<DigitalNumberWithBG> minuteNumber = createNumberTime(minutes);
    List<DigitalNumberWithBG> secondNumber = createNumberTime(seconds);
    return Center(
      child: Container(
        // color: Colors.green,
        height: height * 0.47,
        width: width * 0.90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...hourNumber,
            DigitalColon(height: height * 0.30, color: Colors.white),
            ...minuteNumber,
            DigitalColon(height: height * 0.30, color: Colors.white),
            ...secondNumber,
          ],
        ),
      ),
    );
  }

  List<DigitalNumberWithBG> createNumberTime(int numberTime) {
    final parsedNumberTime = numberTime % 60;
    final isNumberTimeTwoDigits = isNumberTwoDigits(parsedNumberTime);
    final firstNumber = firstDigit(parsedNumberTime);
    final tenDigit = isNumberTimeTwoDigits ? firstNumber : 0;
    final digit = isNumberTimeTwoDigits
        ? int.parse(parsedNumberTime.toString()[1])
        : firstNumber;

    return [
      DigitalNumberWithBG(
        height: height * 0.35,
        value: tenDigit,
      ),
      DigitalNumberWithBG(
        height: height * 0.35,
        value: digit,
      ),
    ];
  }
}

class DigitalNumberWithBG extends StatelessWidget {
  const DigitalNumberWithBG({
    Key key,
    this.value = 0,
    this.padLeft,
    this.height,
    this.color,
    this.backgroundValue = 8,
  }) : super(key: key);

  final int value;
  final int backgroundValue;
  final int padLeft;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Foreground
        DigitalNumber(
          value: value,
          color: Colors.white,
          height: height,
        ),

        // Background
//        DigitalNumber(
//          value: backgroundValue,
//          color: Colors.black12,
//          height: height,
//        ),
      ],
    );
  }
}

bool isNumberTwoDigits(int number) {
  return number.toString().length == 2;
}

int firstDigit(int number) {
  return int.parse(number.toString()[0]);
}