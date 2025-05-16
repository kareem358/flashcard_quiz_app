import 'package:flutter/material.dart';


class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key});
// here we need the question title and the total number of questions,
  //  and also the index
  
  final String question;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child:Text('Question ${indexAction + 1}/$totalQuestions: $question'),
    );
  }
}
