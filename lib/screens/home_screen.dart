import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/question_model.dart';
import '../widgets/question_widget.dart';

// create the HomeScreen widget

//stateful widget because it is the  parent widget and all the variable and function will be
// in this  widget which can change the state of our widget anytime
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //creating a list data for the question
  // whether the list is final or not .. check it later on
final List<Question> _questions= [
    Question(id: '10', title: 'what is 2 +2', options:  {'5':false,
    '6':false, '4':true, '10':false}),
    Question(id: '11', title: 'what is 12 +2', options:  {'5':false,
      '6':false, '14':true, '10':false})

  ];

  //create an index to loop through -questions
  int index=0;
  @override
  Widget build(BuildContext context) {
    // change the background colot
    return Scaffold(
      backgroundColor:Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: background,
        shadowColor: Colors.transparent,
        title: Text('Quiz App'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(

          children: [
            // add the question widget here
            QuestionWidget(indexAction: index,// currently at zero index
                question: _questions[index].title,// first  in the list question
                totalQuestions: _questions.length, // total length of the list

            ),

            const Divider(color: neutral,)
          ],
        ),
      ),
    );
  }
}// import this file to main.dart file
