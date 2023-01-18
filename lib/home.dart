import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize/ans.dart';
import 'package:quize/model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _questionindex = 0;
  // int _totalscore = 0;
  // bool answerwasselected = false;
  // bool endofquize = false;
  // void _questionAnswered(bool answerScore) {
  //   setState(() {
  //     answerwasselected = true;
  //     if (answerScore) {
  //       _totalscore++;
  //     }
  //
  //     if (_questionindex + 1 == _questions.length) {
  //       endofquize = true;
  //     }
  //   });
  // }
  //
  // void _nextQuestion() {
  //   setState(() {
  //     _questionindex++;
  //     answerwasselected = false;
  //   });
  // }
  //
  // void _resetQuize() {
  //   setState(() {
  //     _questionindex = 0;
  //     _totalscore = 0;
  //     answerwasselected = false;
  //     endofquize = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    int index = Provider.of<Model>(context).index;
    int score = Provider.of<Model>(context).score;
    bool end = Provider.of<Model>(context).end;
    String result = Provider.of<Model>(context).result;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite quize'),
          backgroundColor: Colors.red,
        ),
        body: end == false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      Provider.of<Model>(context).questionn[index]['question'],
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...(Provider.of<Model>(context).questionn[index]['answeres']
                          as List<Map<String, Object>>)
                      .map(
                    (answer) => Answer(
                      answerText: answer['answertext'],
                      answertap: () {
                        Provider.of<Model>(context, listen: false)
                            .questionAnswered(answer['score']);

                        if (end == true) {
                        } else {
                          return Provider.of<Model>(context, listen: false)
                              .nextQuestion();
                        }
                      },
                    ),
                  ),
                  const SizedBox(
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
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        result,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Your score are ${score.toString()} out of 4',
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          return Provider.of<Model>(context, listen: false)
                              .resetQuize();
                        },
                        child: const Text('Reset the Quize'),
                      )
                    ],
                  ),
                ),
              ));
  }
}

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
];
