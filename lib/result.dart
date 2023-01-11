import 'package:flutter/material.dart';
import 'package:quize/home.dart';

class Result extends StatelessWidget {
  final MyHomePage homePage= new MyHomePage();
  int hoo;
  final int totalscore;
  Result(this.totalscore);
  String get resultPhrase {
    String resultText;
    if (totalscore == 4) {
      resultText = 'You are awesome!';
      print(totalscore);
    } else if (totalscore == 3) {
      resultText = 'You Are Intermediate';
      print(totalscore);
    }else if (totalscore == 2) {
      resultText = 'You Are Intermediate';
      print(totalscore);
    }    else if (totalscore == 1) {
      resultText = 'You Are Bad';
    }  else {
      resultText = 'You are so Bad';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
