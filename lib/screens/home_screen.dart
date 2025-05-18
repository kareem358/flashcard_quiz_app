import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/question_model.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';
import '../widgets/result_box.dart';


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
 List<Question> _questions= [
    Question(id: '10', title: 'what is 2 +2', options:  {'5':false,
    '6':false, '4':true, '10':false}),
    Question(id: '11', title: 'what is 12 +2', options:  {'5':false,
      '6':false, '14':true, '10':false})

  ];

  //create an index to loop through -questions
  int index=0;
  // create a score variable
 int score =0;
  // create a boolean value to check if the user has clicked or not
 bool isPressed= false;
 bool isAlreadySelected= false;
  // create a function to display the next question
  void nextQuestion(){
    if (index== _questions.length-1){
      //return;
      // the block where the quiz end .. means question end
      showDialog(
          context: context,
          barrierDismissible: false,
          // this will disable the dismiss function outside the box on clicking
          builder: (ctx)=>ResultBox(
        result: score,// total points the user got
        questionLength: _questions.length,// out of  how many question
      ));
    } else {
      if (isPressed) {
        setState(() {
          index++; // after index changing , the app will be rebuild
          isPressed = false;
          isAlreadySelected=false;
        });
      } else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please select at least one option"),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(vertical: 20.0),)
        );
      }
    }
  }
  // create a function for changing color
 void CheckAnswerAndUpdate(bool value){
    if(isAlreadySelected)
      {
        return;
      }else{
      if (value==true) {
        score++;
        setState(() {
          isPressed = true;
          isAlreadySelected= true;
        });
      }

    }


 }
  @override
  Widget build(BuildContext context) {
    // change the background color
    return Scaffold(
      backgroundColor:background,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shadowColor: Colors.transparent,
        title: Text('Quiz App'),
        actions: [
          Padding(padding: const EdgeInsets.all(18.0), child: Text("Score: $score",
          style: const TextStyle(fontSize: 18.0),),),
        ],
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

            const Divider(color: neutral,),
            // add some const space
            const SizedBox(height: 24.0,),
            for(int i=0; i<_questions[index].options.length; i++)
              GestureDetector(
                onTap: ()=>CheckAnswerAndUpdate(_questions[index].options.values.toList()[i]),
                  // lets create a function for checking the right answer
                  //actually we will just modify the colorChange function

                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                // need to check if the answer is correct or false.
                  color: isPressed ? _questions[index].options.values.toList()[i]==true
                    ? correct:
                      incorrect:
                     neutral,
                //onTap: changeColor,
                          ),
              ),

          ],
        ),
      ),
      // use floating button
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion, // the above function called
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}// import this file to main.dart file
