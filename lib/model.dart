import 'package:flutter/material.dart';

class Model extends ChangeNotifier {
  List<Map> questionn = [
    {
      'question': 'what is your favorite color',
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

  int _questionindex = 0;
  int _totalscore = 0;
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

  String get result {
    return resultPhrase;
  }

  int get index {
    return _questionindex;
  }

  int get score {
    return _totalscore;
  }

  bool get end {
    return endofquize;
  }

  void questionAnswered(bool answerScore) {
    if (answerScore) {
      _totalscore++;
    }
    if (_questionindex + 1 == questionn.length) {
      endofquize = true;
    }
    notifyListeners();
  }

  void nextQuestion() {
    _questionindex++;
    notifyListeners();
  }

  void resetQuize() {
    _questionindex = 0;
    _totalscore = 0;
    endofquize = false;
    notifyListeners();
  }

  void updateAccount(input) {
    questionn = input;
    notifyListeners();
  }
}
