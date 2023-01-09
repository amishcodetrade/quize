import 'package:flutter/material.dart';
import 'package:quize/main.dart';
import 'package:quize/third.dart';

class Seconf extends StatelessWidget {
  const Seconf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fquize'),
      ),
      body:Column(
        children: [
          Center(child: Text("what's your favorite Programming Language?",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
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
                      builder: (context) => Terd()),
                );
              },
              child: Text('C',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                      builder: (context) => Terd()),
                );

              },
              child: Text('C++',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                      builder: (context) => Terd()),
                );
              },
              child: Text('Java',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                      builder: (context) => Terd()),
                );
              },
              child: Text('Dart',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ),

        ],
      ),
    );
  }
}
