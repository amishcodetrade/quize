import 'package:flutter/material.dart';
import 'package:quize/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fquize',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      // routes: {
      //   '/result' :(context) => Result(),
      //
      // },
    );
  }
}
