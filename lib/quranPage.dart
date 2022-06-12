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
  int n=0;
  List<String> lst=[];
  MyPainter(this.text){
    text=text.trim();
    lst=text.split(' ');
    n=lst.length;

  }

  @override
  void paint(Canvas canvas, Size size) {
    //
    //                                             <-- Insert your painting code here.
    const textStyle = TextStyle(

      color: Colors.black,
      fontFamily: 'Hafs',
      fontSize: 23,
    );
    //text = lst[0]+'   ';

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
    print(xCenter);
    int numspaces=xCenter~/12-1;
    print(numspaces);
    text='';
    for(int i=0;i<numspaces;i++) {
      text +=lst[i]+'  ';
    }
    for(int x=numspaces;x<n;x++)
      {
        text +=lst[x]+' ';
      }

    print(text);
    final textSpan2 = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter2 = TextPainter(
      text: textSpan2,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,

    );
    textPainter2.layout(
      minWidth: 0,
      maxWidth: double.infinity,
    );


    textPainter2.paint(canvas, Offset(size.width - textPainter2.width,0));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}