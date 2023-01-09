import 'package:flutter/material.dart';
import 'package:quize/main.dart';
import 'package:quize/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fquize',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(title: 'Fquize'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Column(
        children: [
          Center(child: Text("what's your favorite color?",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50)),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => Seconf()),
                );
              },
              child: Text('Black',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50)),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => Seconf()),
                );
              },
              child: Text('Red',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50)),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => Seconf()),
                );
              },
              child: Text('Green',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50)),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => Seconf()),
                );
              },
              child: Text('White',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }
}
