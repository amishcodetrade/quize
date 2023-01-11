import 'package:flutter/material.dart';
import 'package:quize/home.dart';

class Result extends StatelessWidget {
  final int totalscore;
  Result(this.totalscore);
  String get resultPhrase {
    String resultText;
    if (totalscore == 4) {
      resultText = "Your answer are good";
    }else if (totalscore > 1) {
      resultText = 'Your answer are intermediate';
    }else if (totalscore > 1) {
      resultText = 'Your answer are intermediate';
    }else if (totalscore == 1) {
      resultText = 'Your answer are Bad';
    }else {
      resultText = 'You are failed';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body:Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(resultPhrase,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10,
            ),
            Text('Your score are ${totalscore.toString()} out of 4',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),
            SizedBox(
              height: 5,
            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
            },
              child: Text('Reset the Quize'),)
          ],
        ),
      ),
    );
  }
}
