import 'package:flutter/material.dart';
import 'package:quize/ans.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _questionindex = 0;
  int _totalscore = 0;
  bool answerwasselected = false;
  bool endofquize = false;
  String get resultPhrase {
    String resultText;
    if (_totalscore == 4) {
      resultText = "Your answer are good";
    } else if (_totalscore > 1) {
      resultText = 'Your answer are intermediate';
    } else if (_totalscore > 1) {
      resultText = 'Your answer are intermediate';
    } else if (_totalscore == 1) {
      resultText = 'Your answer are Bad';
    } else {
      resultText = 'You are failed';
    }
    return resultText;
  }

  void _questionAnswered(bool answerScore) {
    setState(() {
      answerwasselected = true;
      if (answerScore) {
        _totalscore++;
      }

      if (_questionindex + 1 == _questions.length) {
        endofquize = true;
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

  void _resetQuize() {
    setState(() {
      _questionindex = 0;
      _totalscore = 0;
      answerwasselected = false;
      endofquize = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite quize'),
        ),
        body: endofquize != true
            ? Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      _questions[_questionindex]['question'],
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...(_questions[_questionindex]['answeres']
                          as List<Map<String, Object>>)
                      .map(
                    (answer) => Answer(
                      answerText: answer['answertext'],
                      answertap: () {
                        _questionAnswered(answer['score']);
                        if (answerwasselected == false) {
                          return _questionindex;
                        }

                        if (endofquize == true) {
                        } else {
                          _nextQuestion();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            : Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        resultPhrase,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Your score are ${_totalscore.toString()} out of 4',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          return _resetQuize();
                        },
                        child: Text('Reset the Quize'),
                      )
                    ],
                  ),
                ),
              ));
  }
}

//result screen

//question model
final _questions = const [
  {
    'question': 'what is your favrite color',
    'answeres': [
      {'answertext': 'Black', 'score': true},
      {'answertext': 'Red', 'score': false},
      {'answertext': 'Green', 'score': false},
      {'answertext': 'White', 'score': false}
    ],
  },
  {
    'question': 'what is your Favorite Animal',
    'answeres': [
      {'answertext': 'Rabbit', 'score': false},
      {'answertext': 'Snake', 'score': true},
      {'answertext': 'Elephant', 'score': false},
      {'answertext': 'Lion', 'score': false},
    ]
  },
  {
    'question': 'what is your favorite language',
    'answeres': [
      {'answertext': 'C', 'score': false},
      {'answertext': 'C++', 'score': false},
      {'answertext': 'Jave', 'score': true},
      {'answertext': 'Dart', 'score': false},
    ],
  },
  {
    'question': 'what is your favorite subjecte',
    'answeres': [
      {'answertext': 'Computer programming', 'score': false},
      {'answertext': 'Java', 'score': false},
      {'answertext': 'AWT', 'score': false},
      {'answertext': 'dsa', 'score': true},
    ],
  },
]; //question model
