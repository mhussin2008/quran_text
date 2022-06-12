import 'dart:ui';

import 'package:flutter/material.dart';
import 'QuranData.dart';


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
        child:Padding(
        
        padding: const EdgeInsets.all(5),
        child: Container(
          color: Colors.lightGreenAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
       QuranData.aya.map((e) =>
            CustomPaint(size: Size(width, height/16),painter:
                MyPainter(e))

             ).toList(),
        )
        )



      )));

  }
}


class MyPainter extends CustomPainter {
  //         <-- CustomPainter class
  String text;
  MyPainter(this.text);

  @override
  void paint(Canvas canvas, Size size) {
    //
    //                                             <-- Insert your painting code here.
    const textStyle = TextStyle(

      color: Colors.black,
      fontFamily: 'Hafs',
      fontSize: 23,
    );
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.left,
      textDirection: TextDirection.rtl,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: double.infinity,
    );
    final xCenter = (size.width - textPainter.width) ;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, 0);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}