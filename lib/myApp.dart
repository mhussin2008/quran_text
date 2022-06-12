import 'package:animation_test/quranPage.dart';
import 'package:flutter/material.dart';
import 'myHomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false ,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Hafs'
      ),
      home: const QuranPage(),
    );
  }
}