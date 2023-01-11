import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Color answerColor;
  final Function answertap;
  Answer({ this.answerText, this.answerColor, this.answertap});
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap:answertap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        width:  MediaQuery.of(context).size.width,
        height: 50,
        child: Center(child: Text(answerText,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
        color: answerColor,
      ),
    );
  }
}