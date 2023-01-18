import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function answertap;
  const Answer({Key key, this.answerText, this.answertap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answertap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Colors.red,
        child: Center(
            child: Text(
          answerText,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }
}
