import 'dart:math';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<double> size=[30,80];
  List<Color> color= [Colors.red,Colors.blue];
  List<double> angles=[pi/4,pi/2];
  int selected=0;


  void _incrementCounter() {
    setState(() {
     selected=(selected==0?1:0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        child: Center(
          child: Transform.rotate(
            angle: angles[selected],
            child: AnimatedContainer(duration:const Duration(seconds: 1),
              color: color[selected] ,
              height: size[selected],
              width: size[selected],

            ),
          ),
        ),
      onTap: (){_incrementCounter();},
      ),
      
      ///////////////////////////////////////////
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
