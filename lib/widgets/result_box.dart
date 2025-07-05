import 'package:flutter/material.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({super.key, 
    required this.result,
    required this.questionLength,
    required this.onPressed,
    
  });
  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
          padding: EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Result', 
              style:TextStyle(color: neutral , fontSize: 24.0) ,),
            const SizedBox(height: 20.0,),
            CircleAvatar(radius: 70.0,
              /*backgroundColor: result==questionLength
                  ? correct
                  : result < questionLength/2
                  ? incorrect
                  : result== questionLength/2
                  ? Colors.yellow
                  : Colors.blue,*/
              backgroundColor: result== questionLength/2
                  ?Colors.yellow // yellow on 50% marks
                  :result<questionLength/2
                   ? incorrect // if less then 50% will show red color
                  : correct,child: Text("$result/$questionLength",
            style: TextStyle(fontSize: 22.0),), // on greater than 50% will show green
            ),
            const SizedBox(height: 20.0,),
            Text(
              result == (questionLength ~/ 2)
                  ?' Almost there ' // yellow on 50% marks
                  :result<questionLength/2
                  ? "good Luck Next time" // if less then 50% will show red color
                  : "Great job!", // on greater than 50% will show
              style: TextStyle(color: neutral, fontSize: 20.0),
            ),
            const SizedBox(height: 25.0,),
            GestureDetector(
              onTap: onPressed,
                // now we need a function to , which function is to restart the quiz
                // creating it in the home page


              child: const Text(
                "Start Over",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,

                ),
              ),
            )
          ],
        ),
      
      ),
    );
  }
}
