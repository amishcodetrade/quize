import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize/ans.dart';
import 'package:quize/model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite quize'),
          backgroundColor: Colors.red,
        ),
        body: context.read<Model>().end == false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      Provider.of<Model>(context)
                          .questionn[context.read<Model>().index]['question'],
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...(Provider.of<Model>(context)
                              .questionn[context.read<Model>().index]
                          ['answeres'] as List<Map<String, Object>>)
                      .map(
                    (answer) => Answer(
                      answerText: answer['answertext'],
                      answertap: () {
                        Provider.of<Model>(context, listen: false)
                            .questionAnswered(answer['score']);

                        if (!context.read<Model>().end) {

                           Provider.of<Model>(context, listen: false)
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
                        context.read<Model>().result,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Your score are ${context.read<Model>().score.toString()} out of 4',
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
