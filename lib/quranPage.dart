import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:animation_test/QuranData.dart';


class QuranPage extends StatefulWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(

      body: SafeArea(
        child: Container(
          color: Colors.lightGreenAccent,
          child: CustomPaint( //                       <-- CustomPaint widget
            size: Size(width, height/15),
            painter: MyPainter(),
          ),



            // QuranData.aya.map((e) => Text(e,
            //   textDirection: TextDirection.rtl  ,
            //   textAlign: TextAlign.right,
            //
            //   style: TextStyle(fontFamily: 'Hafs',fontSize: 24, ),
            // )
            //  ).toList()


      )
    )
    );
  }
}


class MyPainter extends CustomPainter { //         <-- CustomPainter class
  @override
  void paint(Canvas canvas, Size size) {
    //
    //                                             <-- Insert your painting code here.
    final textStyle = TextStyle(
      color: Colors.black,
      fontFamily: 'Hafs',
      fontSize: 24,
    );
    final textSpan = TextSpan(
      text: QuranData.aya[0],
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.rtl,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) / 2;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}