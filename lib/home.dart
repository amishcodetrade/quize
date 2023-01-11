import 'package:flutter/material.dart';
import 'package:quize/ans.dart';
import 'package:quize/result.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _questionindex = 0;
  int _totalscore = 0;
  bool answerwasselected = false;
  bool endofquize = false;
  void _questionAnswered(bool answerScore){
    setState(() {
      answerwasselected = true;
      if(answerScore){
        _totalscore++;
      }

      if(_questionindex+1 == _questions.length){
        endofquize= true;
      }
    });
  }
  void _nextQuestion() {
    setState(() {
      _questionindex++;
      answerwasselected = false;
    });
    // if(_questionindex >= _questions.length){
    //   _resetQuize();
    // }
  }
  // void _resetQuize(){
  //   setState(() {
  //     _questioni ndex=0;
  //     _totalscore=0;
  //     answerwasselected = false;
  //     endofquize=false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite quize'),
      ),
      body:Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(child: Text(_questions[_questionindex]['question'],style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          SizedBox(
            height: 20,
          ),
          ...(_questions[_questionindex]['answeres'] as List<Map<String, Object>>).map((answer) => Answer(
            answerText: answer['answertext'],
            answerColor: answerwasselected ? answer['score'] ? Colors.green : Colors.red : Colors.blue,
            answertap: (){
              if(answerwasselected){
                return;
              }
            _questionAnswered(answer['score'] );
            },
          ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            child: ElevatedButton(style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity,40.0),
              backgroundColor: Colors.black,padding: EdgeInsets.all(20),),
                // ignore: void_checks
                onPressed: (){
              if(endofquize==true){
                  Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Result(
                    _totalscore
                  )));
              }
              else{
                _nextQuestion();
              }
              if(!answerwasselected){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please selct answer befor going to next question'),
                ));
                return;
              }
                },
                child: Text(endofquize ? 'Show the Score ': 'Next question',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
            ),
          ),
          SizedBox(
            height: 20,
          ),

        ],

      ),
    );
  }
}
//answer


//result screen




//question model
final  _questions = const[
  {
    'question':'what is your favrite color',
    'answeres' : [
      {'answertext':'Black','score': true},
      {'answertext':'Red','score': false},
      {'answertext':'Green','score': false},
      {'answertext':'White','score': false}
    ],
  },
  {
    'question':'what is your Favorite Animal',
    'answeres':[
      {'answertext':'Rabbit','score':false},
      {'answertext':'Snake','score':true},
      {'answertext':'Elephant','score':false},
      {'answertext': 'Lion' , 'score':false},
    ]
  },
  {
    'question':'what is your favorite Programming language',
    'answeres':[
      {'answertext':'C','score':false},
      {'answertext':'C++','score':false},
      {'answertext':'Jave','score':true},
      {'answertext':'Dart','score':false},
    ],
  },
  {
    'question':'what is your favorite subjecte',
    'answeres':[
      {'answertext':'Computer programming','score':false},
      {'answertext':'Java','score':false},
      {'answertext':'AWT','score':false},
      {'answertext':'dsa','score':true},
    ],
  },
]; //question model
