import 'package:flashcard_appp/model/question_model.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './model/db_connect.dart';
// run the main method

void main ()
{
  var db= DBconnect();
  // db.addQuestion(Question(id: '20', title: 'what is 20 x 3 ?', options:{
  //   '100':false,
  //   '80' : false,
  //   '23' : false,
  //   '60' : true,
  // }));
  db.fetchQuestion();
  runApp(
    const MyApp(),// creating MyApp below
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});// any one line can be okay
  //const MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),// creating  this in a separate folder for different screen
    );
  }
}
