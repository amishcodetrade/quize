import 'package:flutter/material.dart';
import 'package:quize/main.dart';

class Terd extends StatelessWidget {
  const Terd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fquize'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('You are Bad!',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'Home Page')),
            );
          }, child: Text('Restart Quize')),
        ],
      ),
    );
  }
}
